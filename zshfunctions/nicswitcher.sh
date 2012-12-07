function nicswitch() {
  NICSTATUS=`netsh interface show interface "Local Area Connection"|grep Administrative|fawk 3`
  if [[ $NICSTATUS == "Enabled" ]]
    then {
      echo 'Disable NIC';
      netsh interface set interface "Local Area Connection" DISABLE
    }
    else {
      echo 'Enable NIC';
      netsh interface set interface "Local Area Connection" ENABLE
    }
  fi
}
