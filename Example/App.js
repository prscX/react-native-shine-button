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
import Icon from 'react-native-vector-icons/FontAwesome'

export default class App extends Component<{}> {
  constructor (props) {
    super(props)

    this.state = {
      visible: true
    }
  }

  componentDidMount () {
    setInterval(
      () => {
        this.setState({
          visible: !this.state.visible
        })
      }, 1000
    )
  }

  render() {
    let music = <Icon family={"FontAwesome"} name={"music"} color={"#808080"} />;
    let comment = <Icon family={"FontAwesome"} name={"comment"} color={"#808080"} />;
    let microphone = <Icon family={"FontAwesome"} name={"microphone"} color={"#808080"} />;
    let play = <Icon family={"FontAwesome"} name={"play"} color={"#808080"} />;

    return <View style={styles.container}>
        <View style={styles.subContainer}>
          <RNShineButton shape={"heart"} color={"#808080"} fillColor={"#ff0000"} size={100} value={true} />
          <RNShineButton shape={"like"} color={"#808080"} fillColor={"#3d7057"} size={100} />
          <RNShineButton shape={"smile"} color={"#808080"} fillColor={"#703d3d"} size={100} />
          <RNShineButton shape={"star"} color={"#808080"} fillColor={"#3d3d70"} size={100} />
        </View>
        <View style={styles.subContainer}>
          <RNShineButton shape={music} color={"#808080"} fillColor={"#ff0000"} size={100} value={this.state.visible} />
          <RNShineButton shape={comment} color={"#808080"} fillColor={"#3d7057"} size={100} value={this.state.visible} />
          <RNShineButton shape={microphone} color={"#808080"} fillColor={"#703d3d"} size={100} value={this.state.visible} />
          <RNShineButton shape={play} color={"#808080"} fillColor={"#3d3d70"} size={100} value={this.state.visible} />
        </View>
      </View>;
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "column",
    justifyContent: "space-around",
    alignItems: "stretch",
    backgroundColor: "#fafafa"
  },
  subContainer: {
    flex: 1,
    flexDirection: "row",
    justifyContent: "space-around",
    alignItems: "center"
  }
});
