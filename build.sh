#!/bin/sh
cd Telegram

if [ ! -f "TMessagesProj/config/debug.keystore" ]; then
    keytool -genkey -v -keystore TMessagesProj/config/debug.keystore -storepass android -alias androiddebugkey -keypass android -dname "CN=Android Debug,O=Android,C=US"
fi

#gradle clean build
gradle clean assembleDebug

ls -lR TMessagesProj/build/outputs

cp TMessagesProj/build/outputs/apk/app-debug.apk $HOME/Telegram-v3.1.3.apk
