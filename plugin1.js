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
  AppRegistry
} from 'react-native';

const {
  PluginModule
} = NativeModules

type Props = {};
export default class Plugin1 extends Component < Props > {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Hello World! This is the plugin one!
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
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('plugin1', () => Plugin1);