#!/system/bin/sh

MANTIS_FILES_PATH=/storage/emulated/0/Android/data/app.mantispro.gamepad/files
MANTIS_ENTRY_FILE_NAME=buddyNew.sh

MANTIS_ENTRY_SCRIPT_PATH=$MANTIS_FILES_PATH/$MANTIS_ENTRY_FILE_NAME

until [ "$(getprop sys.boot_completed)" ]
do
	sleep 2
done

MANTIS_PACKAGE=$(pm list packages app.mantispro.gamepad)

if [ "$MANTIS_PACKAGE" = "package:app.mantispro.gamepad" ]; then
	am startservice app.mantispro.gamepad/.services.DaemonService > /dev/null 2>&1

	while [[ 1 ]]; do
		if [ -f $MANTIS_ENTRY_SCRIPT_PATH ]; then
			su -c "sh $MANTIS_ENTRY_SCRIPT_PATH" shell > /dev/null 2>&1
			echo "[MAB] Mantis Buddy started!"
			break
		fi
		echo "[MAB] Mantis Buddy start script not found! Sleep 5s..."
		sleep 5
	done
fi