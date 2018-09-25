![](https://github.com/noppefoxwolf/WorkflowKit/blob/master/Meta/banner.png)

[![CI Status](https://img.shields.io/travis/noppefoxwolf/WorkflowKit.svg?style=flat)](https://travis-ci.org/noppefoxwolf/WorkflowKit)
[![Version](https://img.shields.io/cocoapods/v/WorkflowKit.svg?style=flat)](https://cocoapods.org/pods/WorkflowKit)
[![License](https://img.shields.io/cocoapods/l/WorkflowKit.svg?style=flat)](https://cocoapods.org/pods/WorkflowKit)
[![Platform](https://img.shields.io/cocoapods/p/WorkflowKit.svg?style=flat)](https://cocoapods.org/pods/WorkflowKit)

## Usage

```swift
let url = Bundle(for: type(of: self)).url(forResource: "Flashlight Morse", withExtension: "shortcut")!
let workflow = Workflow.init(url: url)!
workflow.actions.map({ $0.identifier })
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WorkflowKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WorkflowKit'
```

## Author

noppefoxwolf, noppelabs@gmail.com

## License

WorkflowKit is available under the MIT license. See the LICENSE file for more info.

## TODO

- [ ] support action params
- [ ] support icon data
- [ ] support enums
