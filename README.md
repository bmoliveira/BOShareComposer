# BOShareComposer

[![Version](https://img.shields.io/cocoapods/v/BOShareComposer.svg?style=flat)](http://cocoapods.org/pods/BOShareComposer)
[![License](https://img.shields.io/cocoapods/l/BOShareComposer.svg?style=flat)](http://cocoapods.org/pods/BOShareComposer)
[![Platform](https://img.shields.io/cocoapods/p/BOShareComposer.svg?style=flat)](http://cocoapods.org/pods/BOShareComposer)

## Example
Its really simple you just need to push the ViewController by a static method with content and options:

```swift
 BOShareViewController
      .presentShareViewController(from: self,
                                  shareContent: shareContentWithoutMetaData,
                                  options: shareOptionsNoMetadata) { (completed, updatedContent) in
                                    print(updatedContent)
    }

```

##Share options

Options to customize the popup

```swift
public struct ShareOptions {

  // Buttons tint color
  public var tintColor: UIColor?

  // Composer title
  public var title: String

  // Dismiss button text
  public var dismissText: String

  // Completion button text
  public var confirmText: String

  // Parse link metadata and show image
  public var showMetadata = true

  // Keyboard appearence
  public var keyboardAppearance: UIKeyboardAppearance
}
```

##ShareContent 

Content to present to user

```swift
public struct ShareContent {
  // Starting text - and after a send is tapped the resulting text of user input
  public var text: String

  // If you want to specify a URL to the content - This url does no show in the editor
  // With this url the metadata will be fetched
  public let link: NSURL?

  // If you are sending a message to a specific user add it here
  public let destinationUserId: String?
}
```

## Installation

BOShareComposer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BOShareComposer"
```

## Author

Bruno Oliveira, bm.oliveira.dev@gmail.com

## License

BOShareComposer is available under the MIT license. See the LICENSE file for more info.
