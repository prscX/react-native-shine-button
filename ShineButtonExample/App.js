/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';

import RNShineButton from 'react-native-shine-button'

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

export default class App extends Component<{}> {
  render() {
    return <View style={styles.container}>
        <RNShineButton shape={"heart"} color={"#808080"} fillColor={"#ff0000"} size={100} />
        <RNShineButton shape={"like"} color={"#808080"} fillColor={"#3d7057"} size={100} />
        <RNShineButton shape={"smile"} color={"#808080"} fillColor={"#703d3d"} size={100} />
        <RNShineButton shape={"star"} color={"#808080"} fillColor={"#3d3d70"} size={100} />
      </View>;
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "row",
    justifyContent: "space-around",
    alignItems: "center",
    backgroundColor: "#F5FCFF"
  }
});
