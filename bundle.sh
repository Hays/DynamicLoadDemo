#!/bin/sh

echo "\n\033[4m$(pwd)\033[0m"

_pwd="$(pwd)"


 react-native bundle --entry-file plugin1.js --platform ios --dev false --bundle-output ${_pwd}/bundles/plugin1.jsbundle --assets-dest ${_pwd}
 react-native bundle --entry-file plugin2.js --platform ios --dev false --bundle-output ${_pwd}/bundles/plugin2.jsbundle --assets-dest ${_pwd}
