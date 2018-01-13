
import React, { Component } from 'react'
import { StyleSheet } from 'react-native'

import { requireNativeComponent } from "react-native";

const ShineButton = requireNativeComponent("RNShineButton", null);

class RNShineButton extends Component {

    render () {
        return <ShineButton style={[style.button]} />;
    }
}

const style = StyleSheet.create({
  button: {
    height: 50,
    width: 50
  }
});

export default RNShineButton