# InAppLocalization

[![Version](https://img.shields.io/cocoapods/v/InAppLocalization.svg?style=flat)](https://cocoapods.org/pods/InAppLocalization)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/InAppLocalization.svg?style=flat)](https://github.com/janlionly/InAppLocalization/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/InAppLocalization.svg?style=flat)](https://github.com/janlionly/InAppLocalization)
![Swift](https://img.shields.io/badge/%20in-swift%204.2-orange.svg)

## Description
**InAppLocalization** which supports to switch the language at run time. Compatible with both Swift and Objective-C.

## Installation
### CocoaPods
```swift
pod 'InAppLocalization'
```

### Carthage
```swift
github "janlionly/InAppLocalization"
```

### Swift Package Manager
- iOS: Open Xcode, File->Swift Packages, search input **https://github.com/janlionly/InAppLocalization.git**, and then select Version Up to Next Major **1.0.0** < .
- Or add dependencies in your `Package.swift`:
```swift
.package(url: "https://github.com/janlionly/InAppLocalization.git", .upToNextMajor(from: "1.0.0")),
```

## Usage

Before do this, Firstly, you should set your **localizations** in your Xcode project; Secondly, add **Localizable.strings** and localize it.


```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  // Set you default language after launching
  InAppLocalization.shared().defaultLanguageCode = "en"
  return true
}

// somewhere you want to change language call this, remember to reload your view controller.
let ctrl = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
InAppLocalization.shared().setCurrentLanguageCode("ja", reload: ctrl) { (view) in
   view.alpha = 0
}
```

**Attention**: if set the viewController's **modalPresentationStyle** is **.fullScreen** or **.currentContext**, when dismissing viewController with the gesture, you cann't see the source viewController, replace it with a black background, so if you want to see the source viewController, please set **modalPresentationStyle** to other styles.

## Requirements

- iOS 8.0+
- Swift 4.2 to 5.2

## Author
Visit my github: [janlionly](https://github.com/janlionly)<br>
Contact with me by email: janlionly@gmail.com

## Contribute
I would love you to contribute to **InAppLocalization**

## License
**InAppLocalization** is available under the MIT license. See the [LICENSE](https://github.com/janlionly/InAppLocalization/blob/master/LICENSE) file for more info.