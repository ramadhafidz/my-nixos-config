#!/bin/bash

DEVICE ID=$(kdeconnect-cli --list-devices | grep 'paired' | head -n1 | awk '{print $1}')

while true; do
  CLIPBOARD=$(wl-paste --watch)
  echo "$CLIPBOARD" | kdeconnect-cli --device "$DEVICE_ID" --share-clipboard -
done
