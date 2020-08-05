//
// DefaultAllowXCameraConfiguration.swift
//
// Copyright (c) 2020 KarimEbrahem (https://www.kebrahem.dev)
//
// AllowX is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import SwiftEntryKit

class DefaultAllowXCameraConfiguration: AllowXConfiguration {
    var alertHeight: EKAttributes.PositionConstraints.Edge {
        return .intrinsic
    }
    
    var image: UIImage {
        return UIImage(named: "img_graphics_no_search_results_1", in: Bundle(for: AllowX.self), compatibleWith: nil)!
    }
    
    var prePermissionTitle: String {
        return "Camera Access"
    }
    
    var deniedTitle: String {
        return "Camera Access"
    }
    
    var disabledTitle: String {
        return "Camera Access"
    }
    
    var titleFont: UIFont {
        return .boldSystemFont(ofSize: 16)
    }
    
    var titleColor: UIColor {
        return .darkGray
    }
    
    var prePermissionMessage: String {
        return "To capture image, allow us to access your camera"
    }
    
    var deniedMessage: String {
        return "To capture image, allow us to access your camera"
    }
    
    var disabledMessage: String {
        return "To capture image, allow us to access your camera"
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
