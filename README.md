## PGLevelIndicator

![](https://img.shields.io/badge/language-swift-blue.svg)
![](https://img.shields.io/badge/version-1.0.0-red.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/cocoapods/p/RecordButton.svg?style=flat)](https://github.com/pablogsIO/PGLevelIndicator)


A swift component to show levels of whatever you want

<p align="center">
  <img width="400" src="/Assets/pglevelindicator.gif">
</p>


## Requirements

- Swift 4.

## Example Project

You have a fully functional demo in PGLevelIndicator folder

## Usage

- Create an array of parameters:


```swift
let parameters = [ItemParameters(title: "nO2 Band", titleColor: UIColor.purple, level: .low), ItemParameters(title: "o3 Band", titleColor: UIColor.yellow, level: .medium), ItemParameters(title: "pM10 Band", titleColor: UIColor.green, level: .high), ItemParameters(title: "pM25 Band", titleColor: UIColor.orange, level: .low)]

```

(The level parameter is not used, but maybe in future revisions we will use it)

- Create the PGLevelIndicator object:

```swift
let levelIndicator = PGLevelIndicator(frame: CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.width), itemsParameters: parameters)

```

- And finally, add to the main view

```swift
self.view.addSubview(levelIndicator!)
```

## Support/Issues
If you have any questions, please don't hesitate to create an issue.

## To-Do
* Add Cocoapods

## License
RecordButton is available under the MIT license. See the LICENSE file for more info.

If you use it, I'll be happy to know about it.
