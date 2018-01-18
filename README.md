
# React Native: Shine Button (Android/iOS)

<img src="https://raw.githubusercontent.com/ChadCSong/ShineButton/master/demo_shine_others.gif">

React Native Bridge for [ChadCSong/ShineButton](https://github.com/ChadCSong/ShineButton) & [imwcl/WCLShineButton](https://github.com/imwcl/WCLShineButton). Effects like shining.

Before we dive into on how to use this library. We would like to thank all the contributor of [ChadCSong/ShineButton](https://github.com/ChadCSong/ShineButton) & [imwcl/WCLShineButton](https://github.com/imwcl/WCLShineButton) for providing such a awesome nice, cool library

## Getting started

- `$ npm install react-native-shine-button --save`

- `$ react-native link react-native-shine-button`

#### iOS
- Add WCLShineButton.framework in Embedded Binaries & Linked Frameworks and Libraries. You can find this library from below path:

`node_modules/react-native-shine-button/ios/WCLShineButton/WCLShineButton.xcodeproj`

<img src="assets/setup.png">

## Usage

```javascript
import RNShineButton from 'react-native-shine-button';

<RNShineButton shape={"heart"} color={"#808080"} fillColor={"#ff0000"} size={50} />

```

## Props


| Prop              | Type       | Default | Note                                                                                                       |
| ----------------- | ---------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `shape`           | `JSON`     |         | The type of Shine Button you want. It's props are heart, like, star, smile |
| `color`       | `JSON`     |         | Color which you want then the Shine Button is not active                                                            |
| `fillColor`     | `Function` |         | Fill Color then the Shine Button is clicked                                                      |
| `size` | `Function` |         | Size of Shine Button                                                   |  |
| `disabled`    | `bool`     |         | Disabling the Shine Button                                        |  |
| `value`      | `bool`     |         | Default value whether it is selected or not
| `onChange`      | `func`     |         | It is invoke then the value of shine button is change


## Credit
- Android lib [ChadCSong/ShineButton](https://github.com/ChadCSong/ShineButton) Android implement. 
- iOS lib [imwcl/WCLShineButton](https://github.com/imwcl/WCLShineButton) iOS implement

## Contribution
Contributions are welcome and are greatly appreciated! Every little bit helps, and credit will always be given.


## License
Copyright @2017 Pranav Raj Singh Chauhan

RNShineButton is provided under the MIT License.