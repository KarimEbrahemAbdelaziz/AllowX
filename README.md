<p align="center">
    <img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/Screenshots/Logo.png" width="480” max-width="90%" alt="AllowX" />
</p>

<p align="center">
    <img src="https://github.com/KarimEbrahemAbdelaziz/AllowX/workflows/Build/badge.svg" />
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://cocoadocs.org/pods/AllowX/">
        <img src="http://img.shields.io/badge/Cocoapods-available-green.svg?style=flat" alt="Cocoapod" />
    </a>
    <img src="http://img.shields.io/badge/version-1.0.3-green.svg?style=flat" alt="Version" />
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
pod 'AllowX', '~> 1.0.3'
```

## Usage

AllowX supports 3 kinds of permissions (for now).

```swift
// AllowX Camera Permission.
let cameraPermission: AllowX = AllowX(type: .camera)

// AllowX Location Always Permission.
let locationAlwaysPermission: AllowX = AllowX(type: .locationAlways)

// AllowX Location While in Use Permission.
let locationWhileInUsePermission: AllowX = AllowX(type: .locationWhenInUse)

// AllowX Notifications Permission.
let notificationsPermission: AllowX = AllowX(type: .notifications([.alert, .badge, .sound]))
```

There are defaults for every value in the permission dialog, but you can change all of them using these properties:

```swift
// AllowX Permission Alert Height.
// The default value is .intrinsic to adapt on the content.
cameraPermission.alertHeight = .constant(value: 400)

// AllowX Permission Dialog Image.
cameraPermission.image = UIImage(named: "camera")

// AllowX Permission Dialog Title.
cameraPermission.title = "Camera Custom Access"
cameraPermission.titleFont = .boldSystemFont(ofSize: 22)
cameraPermission.titleColor = . darkGray

// AllowX Permission Dialog Message.
cameraPermission.message = "Please give us permission to capture your awesome moments."
cameraPermission.messageFont = .systemFont(ofSize: 16)
cameraPermission.messageColor = .gray

// AllowX Permission Dialog Cancel Button's Title.
cameraPermission.cancelButtonTitle = "Cancel"

// AllowX Permission Dialog NotNow Button's Title.
cameraPermission.notNowButtonTitle = "Not now"

// AllowX Permission Dialog Go to Settings Button's Title.
cameraPermission.goToSettingsButtonTitle = "Go to Settings"

// AllowX Permission Dialog Confirm Button's Title.
cameraPermission.confirmButtonTitle = "Allow Permission"

// AllowX Permission Dialog Button Title's Font.
cameraPermission.buttonTitleFont = .boldSystemFont(ofSize: 14)
```

By default AllowX will ask for permission and present corresponding dialog for the permission's status, but you can disable presenting those dialogs

```swift
// Control if you want to present Pre-Premission dialog.
cameraPermission.presentPrePermissionAlert = true

// Control if you want to present Denied dialog.
cameraPermission.presentDeniedAlert = true

// Control if you want to present Disabled dialog.
cameraPermission.presentDisabledAlert = true
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
