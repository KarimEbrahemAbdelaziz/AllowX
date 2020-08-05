//
//  CustomCameraConfiguration.swift
//  AllowX_Example
//
//  Created by KarimEbrahem on 8/5/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import AllowX
import SwiftEntryKit

class CustomCameraConfiguration: AllowXConfiguration {
    var alertHeight: EKAttributes.PositionConstraints.Edge {
        return .constant(value: 400)
    }
    
    var image: UIImage {
        return UIImage(named: "camera")!
    }
    
    var prePermissionTitle: String {
        return "Camera Permission"
    }
    
    var deniedTitle: String {
        return "Camera Permission"
    }
    
    var disabledTitle: String {
        return "Camera Permission"
    }
    
    var titleFont: UIFont {
        return .boldSystemFont(ofSize: 16)
    }
    
    var titleColor: UIColor {
        return .darkGray
    }
    
    var prePermissionMessage: String {
        return "Please, To scan codes, allow us to access your camera"
    }
    
    var deniedMessage: String {
        return "Please, To scan codes, allow us to access your camera"
    }
    
    var disabledMessage: String {
        return "Please, To scan codes, allow us to access your camera"
    }
    
    var messageFont: UIFont {
        return .systemFont(ofSize: 16)
    }
    
    var messageColor: UIColor {
        return .gray
    }
    
    var cancelButtonTitle: String {
        return "Cancel"
    }
    
    var notNowButtonTitle: String {
        return "Not Now"
    }
    
    var goToSettingsButtonTitle: String {
        return "Go to Settings"
    }
    
    var confirmButtonTitle: String {
        return "Allow"
    }
    
    var buttonTitleFont: UIFont {
        return .systemFont(ofSize: 16)
    }
    
    var presentPrePermissionAlert: Bool {
        return true
    }
    
    var presentDeniedAlert: Bool {
        return true
    }
    
    var presentDisabledAlert: Bool {
        return true
    }
}
