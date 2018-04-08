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
  NativeModules
} from 'react-native';

const {
  PluginModule
} = NativeModules

type Props = {};
export default class App extends Component < Props > {
  render() {
    return (
      <View style={styles.container}>
        <Button title="Plugin1" onPress={() => {
          PluginModule.openPlugin1()
        }} />

        <Button title="Plugin2" onPress={() => {
          PluginModule.openPlugin2()
        }} />
        <Button title="Html" onPress={() => {
          PluginModule.openHtml()
        }} />
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