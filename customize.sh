print_modname() {
  ui_print "*******************************"
  ui_print "* --== Mantis Auto Buddy ==-- *"
  ui_print "*******************************"
}

print_modname

MANTIS_PACKAGE=$(pm list packages app.mantispro.gamepad)

if [ "$MANTIS_PACKAGE" = "package:app.mantispro.gamepad" ]; then
  ui_print "Mantis Gamepad Pro installation found! Starting service now..."
  sh $MODPATH/service.sh
else
  abort "Mantis Gamepad Pro installation not found!\nPlease install the app and try again!"
fi

rm -r $MODPATH/__MACOSX

chmod +x $MODPATH/service.sh