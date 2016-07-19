# BOShareComposer

[![Version](https://img.shields.io/cocoapods/v/BOShareComposer.svg?style=flat)](http://cocoapods.org/pods/BOShareComposer)
[![License](https://img.shields.io/cocoapods/l/BOShareComposer.svg?style=flat)](http://cocoapods.org/pods/BOShareComposer)
[![Platform](https://img.shields.io/cocoapods/p/BOShareComposer.svg?style=flat)](http://cocoapods.org/pods/BOShareComposer)

## Example
Its really simple you just need to push the ViewController by a static method:

```swift
BOShareViewController.presentShareViewController(from: self, shareViewModel: shareViewModel, shareDelegate: self)
```

Share delegate has the following methods:

```swift
extension ViewController: ShareDelegate {
// Modal will appear
func willAppear()

// When share is submited viewModel cames with the new text
func submit(viewModel: ShareViewModel)

// Modal will be dismissed
func willDisapear()
}
```

ShareViewModel 

```swift
public struct ShareViewModel {
// Starting text - and after a send is tapped the resulting text of user input
public var text: String

// If you want to specify a URL to the content - This url does no show in the editor
public let link: NSURL?

// Composer title
public let title: String

// If you are sending a message to a specific user add it here
public let destinationUserId: String?

public init(text: String, title: String = "Share", link: NSURL? = nil, destinationUserId: String? = nil){
self.text = text
self.title = title
self.link = link
self.destinationUserId = destinationUserId
}
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
