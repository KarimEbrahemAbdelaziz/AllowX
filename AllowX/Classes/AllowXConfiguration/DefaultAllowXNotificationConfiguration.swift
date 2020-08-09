//
//  DefaultAllowXNotificationConfiguration.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/5/20.
//

import Foundation
import SwiftEntryKit

class DefaultAllowXNotificationConfiguration: AllowXConfiguration {
    
    var alertHeight: EKAttributes.PositionConstraints.Edge {
        return .intrinsic
    }
    
    var image: UIImage {
        return UIImage(named: "img_graphics_notification", in: Bundle(for: AllowX.self), compatibleWith: nil)!
    }
    
    var prePermissionTitle: String {
        return "Notification Access"
    }
    
    var deniedTitle: String {
        return "Notification Access"
    }
    
    var disabledTitle: String {
        return "Notification Access"
    }
    
    var titleFont: UIFont {
        return .boldSystemFont(ofSize: 16)
    }
    
    var titleColor: UIColor {
        return .darkGray
    }
    
    var prePermissionMessage: String {
        return "Enable push notifications to let send you personal news and updates"
    }
    
    var deniedMessage: String {
        return "Enable push notifications to let send you personal news and updates"
    }
    
    var disabledMessage: String {
        return "Enable push notifications to let send you personal news and updates"
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
        return "Enable Notifications"
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
