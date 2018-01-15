
import React, { Component } from 'react'
import { StyleSheet, ViewPropTypes } from "react-native"
import PropTypes from 'prop-types'

import { requireNativeComponent } from "react-native"

class RNShineButton extends Component {

    _onChange = (event) => {
      this.props.onChange && this.props.onChange(event);
      this.props.onValueChange && this.props.onValueChange(event.nativeEvent.value);

      this._shineButton.setNativeProps({ on: event.nativeEvent.value});
    }

    render () {
      return <ShineButton
          {...this.props}
          ref={(ref) => { this._shineButton = ref; }}
          style={{ width: this.props.size, height: this.props.size }}
          size={this.props.size}
          on={this.props.value}
          disable={this.props.disabled}
          shape={this.props.shape}
          color={this.props.color}
          fillColor={this.props.fillColor}
          onChange={this._onChange}
        />;
    }
}


RNShineButton.propTypes = {
  ...ViewPropTypes,

  /**
   * is the checkbox checked. Default false
   */
  value: PropTypes.bool,
  disabled: PropTypes.bool,
  shape: PropTypes.string,
  on: PropTypes.bool,
  color: PropTypes.string,
  fillColor: PropTypes.string,
  size: PropTypes.number
};

RNShineButton.defaultProps = {
  value: false,
  disabled: false,
  size: 100
};


const ShineButton = requireNativeComponent("RNShineButton", RNShineButton, {
  nativeOnly: { onChange: true, on: true }
})

export default RNShineButton