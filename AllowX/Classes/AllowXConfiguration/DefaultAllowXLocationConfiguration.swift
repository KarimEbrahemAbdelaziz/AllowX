//
//  DefaultAllowXLocationConfiguration.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/5/20.
//

import Foundation
import SwiftEntryKit

class DefaultAllowXLocationConfiguration: AllowXConfiguration {
    
    var alertHeight: EKAttributes.PositionConstraints.Edge {
        return .intrinsic
    }
    
    var image: UIImage {
        return UIImage(named: "img_graphics_map", in: Bundle(for: AllowX.self), compatibleWith: nil)!
    }
    
    var prePermissionTitle: String {
        return "Location Access"
    }
    
    var deniedTitle: String {
        return "Location Access"
    }
    
    var disabledTitle: String {
        return "Location Access"
    }
    
    var titleFont: UIFont {
        return .boldSystemFont(ofSize: 16)
    }
    
    var titleColor: UIColor {
        return .darkGray
    }
    
    var prePermissionMessage: String {
        return "Please enable location access to use this feature"
    }
    
    var deniedMessage: String {
        return "Please enable location access to use this feature"
    }
    
    var disabledMessage: String {
        return "Please enable location access to use this feature"
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
        return "Enable Location"
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
