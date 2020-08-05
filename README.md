<p align="center">
    <img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/Screenshots/Logo.png" width="480” max-width="90%" alt="AllowX" />
</p>

<p align="center">
    <img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/workflows/Build/badge.svg" />
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://cocoadocs.org/pods/AllowX/">
        <img src="http://img.shields.io/badge/Cocoapods-available-green.svg?style=flat" alt="Cocoapod" />
    </a>
    <img src="http://img.shields.io/badge/version-1.1.0-green.svg?style=flat" alt="Version" />
    <a href="https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-70a1fb.svg?style=flat" alt="MIT License" />
    </a>
    <br>
    <a href="https://www.facebook.com/KarimEbrahemAbdelaziz">
        <img src="http://img.shields.io/badge/facebook-%40KarimEbrahemAbdelaziz-70a1fb.svg?style=flat" alt="Facebook: @KarimEbrahemAbdelaziz" />
    </a>
    <a href="https://twitter.com/@k_ebrahem_">
        <img src="https://img.shields.io/badge/twitter-@k_ebrahem_-blue.svg?style=flat" alt="Twitter: @k_ebrahem_" />
    </a>
</p>

#

AllowX exposes a unified API to request permissions on iOS with awesome dialog for permssion requests.

- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
    - [Cocoapods](#cocoapods)
- [Usage](#usage)
- [Author](#author)
- [License](#license)

## Screenshots

<img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/Screenshots/1.png" width="250" height="500"> <img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/Screenshots/2.png" width="250" height="500"> <img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/Screenshots/3.png" width="250" height="500">

## Requirements

* Xcode 10.2+
* Swift 5+
* iOS 10+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate AllowX into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'AllowX', '~> 1.1.0'
```

## Usage

AllowX provide configuration protocol `AllowXConfiguration` to allow you configure all status titles and messages. All you have to do to configure permission alert is to create custom configuration class that conform to `AllowXConfiguration` protocol.

```swift
class CustomCameraConfiguration: AllowXConfiguration {
    // AllowX Permission Alert Height.
    var alertHeight: EKAttributes.PositionConstraints.Edge {
        return .constant(value: 400)
    }
    
    // AllowX Permission Alert Image.
    var image: UIImage {
        return UIImage(named: "camera")!
    }
    
    // AllowX Pre-Permission Alert Title.
    var prePermissionTitle: String {
        return "Camera Permission"
    }
    
    // AllowX Denied Permission Alert Title.
    var deniedTitle: String {
        return "Camera Permission"
    }
    
    // AllowX Disabled Permission Alert Title.
    var disabledTitle: String {
        return "Camera Permission"
    }
    
    // AllowX Permission Alert Title's Font.
    var titleFont: UIFont {
        return .boldSystemFont(ofSize: 16)
    }
    
    // AllowX Permission Alert Title's Color.
    var titleColor: UIColor {
        return .darkGray
    }
    
    // AllowX Pre-Permission Alert Message.
    var prePermissionMessage: String {
        return "Please, To scan codes, allow us to access your camera"
    }
    
    // AllowX Denied Permission Alert Message.
    var deniedMessage: String {
        return "Please, To scan codes, allow us to access your camera"
    }
    
    // AllowX Disabled Permission Alert Message.
    var disabledMessage: String {
        return "Please, To scan codes, allow us to access your camera"
    }
    
    // AllowX Permission Alert Message's Font.
    var messageFont: UIFont {
        return .systemFont(ofSize: 16)
    }
    
    // AllowX Permission Alert Message's Color.
    var messageColor: UIColor {
        return .gray
    }
    
    // AllowX Permission Alert Cancel Button's Title.
    var cancelButtonTitle: String {
        return "Cancel"
    }
    
    // AllowX Permission Alert Not Now Button's Title.
    var notNowButtonTitle: String {
        return "Not Now"
    }
    
    // AllowX Permission Alert Go to Settings Button's Title.
    var goToSettingsButtonTitle: String {
        return "Go to Settings"
    }
    
    // AllowX Permission Alert Confirm Button's Title.
    var confirmButtonTitle: String {
        return "Allow"
    }
    
    // AllowX Permission Dialog Button Title's Font.
    var buttonTitleFont: UIFont {
        return .systemFont(ofSize: 16)
    }
    
    // Control if you want to present Pre-Premission Alert.
    var presentPrePermissionAlert: Bool {
        return true
    }
    
    // Control if you want to present Denied Alert.
    var presentDeniedAlert: Bool {
        return true
    }
    
    // Control if you want to present Disabled Alert.
    var presentDisabledAlert: Bool {
        return true
    }
}
```

Init AllowX permission with configuration. (There're default configuration  values for each permission)

```swift
// Create AllowX Camera Permission Configuration.
let configuration = CustomCameraConfiguration()

// AllowX Camera Permission.
let cameraPermission: AllowX = AllowX(type: .camera, configuration: configuration)
```

AllowX supports 3 kinds of permissions (for now) Camera, Location and Notifications Permissions.

```swift
// AllowX Location Always Permission.
let locationAlwaysPermission: AllowX = AllowX(type: .locationAlways)

// AllowX Location While in Use Permission.
let locationWhileInUsePermission: AllowX = AllowX(type: .locationWhenInUse)

// AllowX Notifications Permission.
let notificationsPermission: AllowX = AllowX(type: .notifications([.alert, .badge, .sound]))
```

You can specifiy a block of code to be excuted when you ask about permission's status

```swift
// Ask for Premission 🔥
cameraPermission.request { status in
    switch status {
    case .authorized:    print("authorized")
    case .denied:        print("denied")
    case .disabled:      print("disabled")
    case .notDetermined: print("not determined")
    }
}
```

## Author

Karim Ebrahem, karimabdelazizmansour@gmail.com

## License

AllowX is available under the MIT license. See the `LICENSE` file for more info.

It will be updated when necessary and fixes will be done as soon as discovered to keep it up to date.

Enjoy!
