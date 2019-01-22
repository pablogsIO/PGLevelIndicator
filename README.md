## PGLevelIndicator

![](https://img.shields.io/badge/language-swift-blue.svg)
![](https://img.shields.io/badge/version-1.0.0-red.svg)
[![License](https://img.shields.io/cocoapods/l/PGLevelIndicator.svg?style=flat)](https://github.com/pablogsIO/PGLevelIndicator)
[![Platform](https://img.shields.io/cocoapods/p/PGLevelIndicator.svg?style=flat)](https://github.com/pablogsIO/PGLevelIndicator)


A swift component that shows levels of whatever you want.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/pablogsIO/PGLevelIndicator/master/Assets/levelindicator.gif">
</p>


## Requirements

- Swift 4.

## Example Project

You have a fully functional demo in [PGLevelIndicator](https://github.com/pablogsIO/PGLevelIndicator/tree/master/PGLevelIndicator) folder

## Install

### Manually

Just drag and drop [Source](https://github.com/pablogsIO/PGLevelIndicator/tree/master/Source) folder in your project

## Using PGLevelIndicator

- Create attributed strings with the text you want


```swift

let font: UIFont? = UIFont(name: "Avenir-Book", size: 18)
let fontSuper: UIFont? = UIFont(name: "Avenir-Book", size: 10)

```

```swift

let attStringNO2 = NSMutableAttributedString(string: "NO2", attributes: [.font: font!])

attStringNO2.setAttributes([.font: fontSuper!, .baselineOffset: -5],
                          range: NSRange(location: 2, length: 1))

```

- Create an array of parameters:

```swift

let parameters = [ItemParameters(title: attStringNO2, titleColor: UIColor.red, level: .low),
                  ItemParameters(title: attStringO3, titleColor: UIColor.yellow, level: .medium),
                  ItemParameters(title: attStringpM10, titleColor: UIColor.green, level: .high),
                  ItemParameters(title: attStringPM25, titleColor: UIColor.orange, level: .low)]

```

(The level parameter is not used, but maybe in future revisions we will use it)

- Create the PGLevelIndicator object:

```swift

let levelIndicator = PGLevelIndicator(frame: CGRect(x: 0,
                                                    y: 100,
                                                    width: self.view.frame.size.width,
                                                    height: self.view.frame.size.width),
                                      itemsParameters: parameters)

```

- And finally, add the levelIndicator to the main view

```swift

self.view.addSubview(levelIndicator!)

```

And voilá....

<p align="center">
  <img width="300" src="https://raw.githubusercontent.com/pablogsIO/PGLevelIndicator/master/Assets/example.gif">
</p>

## Support/Issues
If you have any questions, please don't hesitate to create an issue.

## To-Do
* Add Cocoapods

## License
PGLevelIndicator is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

If you use it, I'll be happy to know about it.
