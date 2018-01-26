#!/bin/bash

if [ -z $1 ]; then
  echo "Pass an app bundle ID"
  exit
fi
APP_BUNDLE_ID=$1

SIM_LINES=$(xcrun simctl list | sed '/== Device Pairs/q' | grep Booted | sed -e 's/^[ \t]*//' | sed -e 's/ (Booted)//')

# Split simulators list by newline, not by space
oldIFS=$IFS
IFS=$'\n'
options=($SIM_LINES)
IFS=$oldIFS

SIMS_COUNT=`echo "$SIM_LINES" | wc -l`

if [ $SIMS_COUNT -gt 1 ]; then

  PS3='Select simulator device: '
  select answer in "${options[@]}";
  do
    for item in "${options[@]}"; 
    do
      if [[ $item == $answer ]]; then
        break 2
      fi
    done
  done

else
  answer=$SIM_LINES
fi

SIM_ID=$(echo "$answer" | sed 's/^[^(]*(\([^)]*\)).*/\1/')
SIM_NAME=$(echo "$answer"| sed -e 's/ (.*$//')

echo "The app $APP_BUNDLE_ID will now be deleted from $SIM_NAME"

xcrun simctl uninstall "$SIM_ID" "$APP_BUNDLE_ID"
