
<p align="center">
  <img src="https://raw.githubusercontent.com/ChadCSong/ShineButton/master/demo_shine_others.gif" height="300" width="600" >
</p>

<p align="center">
  <img src="./assets/hero.gif" height="300" width="600" >
</p>


<p align="center">
  <a href="https://www.npmjs.com/package/react-native-shine-button"><img src="http://img.shields.io/npm/v/react-native-shine-button.svg?style=flat" /></a>
  <a href="https://github.com/prscX/react-native-shine-button/pulls"><img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" /></a>
  <a href="https://github.com/prscX/react-native-shine-button#License"><img src="https://img.shields.io/npm/l/react-native-shine-button.svg?style=flat" /></a>
</p>


# React Native: Shine Button (Android/iOS)

React Native Bridge for native [ChadCSong/ShineButton](https://github.com/ChadCSong/ShineButton) & [imwcl/WCLShineButton](https://github.com/imwcl/WCLShineButton). Effects like shining.

## Getting started

- `$ npm install react-native-shine-button --save`

- `$ react-native link react-native-shine-button`

- `$ react-native link react-native-vector-icons`


#### Android

- Please add below snippet to `defaultConfig` in app `build.gradle`file. This is with respect to [ISSUE: 1](https://github.com/prscX/react-native-shine-button/issues/1):

```
jackOptions {
    enabled true
}
```

#### iOS
- Add WCLShineButton.framework in Embedded Binaries & Linked Frameworks and Libraries. You can find this library from below path:

`node_modules/react-native-shine-button/ios/WCLShineButton/WCLShineButton.xcodeproj`

<img src="assets/setup.png">

## Usage

```javascript
import RNShineButton from 'react-native-shine-button';

<RNShineButton shape={"heart"} color={"#808080"} fillColor={"#ff0000"} size={100} />

```


## Vector Icons Usage
Now you can even provide custom vector icons by using [react-native-vector-icons](https://github.com/oblador/react-native-vector-icons). Please use below snippet:

```javascript
import RNShineButton from 'react-native-shine-button';
import Icon from 'react-native-vector-icons/FontAwesome'

let music = <Icon family={"FontAwesome"} name={"music"} color={"#808080"} />;

<RNShineButton shape={music} color={"#808080"} fillColor={"#ff0000"} size={100} />

```

> **Note:**
> - We have added `family` prop for `Icon` class, please make sure that you pass the props



## Props


| Prop              | Type       | Default | Note                                                                                                       |
| ----------------- | ---------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `shape`           | `string OR react-native-vector-icons`     |         | The type of Shine Button you want. It's props are heart, like, star, smile. Even you are specify a react-native-vector-icons |
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
Copyright @ Pranav Raj Singh Chauhan

RNShineButton is provided under the Apache License.

