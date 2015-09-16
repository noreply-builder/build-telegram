#!/bin/sh
cd Telegram

# setup api key
sed -i "s/int APP_ID = 0;/int APP_ID = $APP_ID;/g" TMessagesProj/src/main/java/org/telegram/messenger/BuildVars.java
sed -i "s/APP_HASH = \"\";/APP_HASH = \"$APP_HASH\";/g" TMessagesProj/src/main/java/org/telegram/messenger/BuildVars.java

if [ ! -f "TMessagesProj/config/debug.keystore" ]; then
    keytool -genkey -v -keystore TMessagesProj/config/debug.keystore -storepass android -alias androiddebugkey -keypass android -dname "CN=Android Debug,O=Android,C=US"
fi

#gradle clean build
gradle clean assembleDebug

ls -lR TMessagesProj/build/outputs

cp TMessagesProj/build/outputs/apk/TMessagesProj-debug.apk $HOME/Telegram-v3.1.3.apk
