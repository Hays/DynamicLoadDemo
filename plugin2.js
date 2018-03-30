/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {
  Component
} from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules,
  AppRegistry,
  Image
} from 'react-native';

const {
  PluginModule
} = NativeModules

type Props = {};
const source = Platform.select({
  ios: require('assets/bg.png'),
  android: {
    uri: 'file:///sdcard/bg@2x.png'
  }
})
export default class Plugin2 extends Component < Props > {
  render() {
    return (
      <View style={styles.container}>
      <Image style={StyleSheet.absoluteFillObject} source={source} />
        <Text style={styles.welcome}>
          Hello World! This is the plugin two!
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    color: 'white',
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('plugin2', () => Plugin2);