#!/bin/sh

echo "\n\033[4m$(pwd)\033[0m"

_pwd="$(pwd)"


 react-native bundle --entry-file plugin1.js --platform ios --dev false --bundle-output ${_pwd}/bundles/plugin1.ios.jsbundle --assets-dest ${_pwd}
 react-native bundle --entry-file plugin2.js --platform ios --dev false --bundle-output ${_pwd}/bundles/plugin2.ios.jsbundle --assets-dest ${_pwd}
 react-native bundle --entry-file plugin1.js --platform android --dev false --bundle-output ${_pwd}/android/app/src/main/assets/plugin1.android.jsbundle --assets-dest ${_pwd}
 react-native bundle --entry-file plugin2.js --platform android --dev false --bundle-output ${_pwd}/android/app/src/main/assets/plugin2.android.jsbundle --assets-dest ${_pwd}
