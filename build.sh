#!/bin/sh
cd Telegram

#gradle clean build
gradle clean assembleDebug

ls -lR app/build/outputs

cp app/build/outputs/apk/app-debug.apk $HOME/Telegram-v3.1.3.apk
