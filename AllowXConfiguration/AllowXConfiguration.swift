//
// AllowXConfiguration.swift
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

public protocol AllowXConfiguration {
    /// The permission alert height.
    var alertHeight: EKAttributes.PositionConstraints.Edge { get }
    
    /// The permission image.
    var image: UIImage { get }
    
    /// The notification permission title.
    var prePermissionTitle: String { get }
    
    /// The notification permission title.
    var deniedTitle: String { get }
    
    /// The notification permission title.
    var disabledTitle: String { get }
    
    /// The notification permission title font.
    var titleFont: UIFont { get }
    
    /// The notification permission title color.
    var titleColor: UIColor { get }
    
    /// The notification permission title.
    var prePermissionMessage: String { get }
    
    /// The notification permission title.
    var deniedMessage: String { get }
    
    /// The notification permission title.
    var disabledMessage: String { get }
    
    /// The notification permission message font.
    var messageFont: UIFont { get }
    
    /// The notification permission message color.
    var messageColor: UIColor { get }
    
    /// The notification permission cancel button title.
    var cancelButtonTitle: String { get }
    
    /// The notification permission not now button title.
    var notNowButtonTitle: String { get }
    
    /// The notification permission go to settings button title.
    var goToSettingsButtonTitle: String { get }
    
    /// The notification permission allow button title.
    var confirmButtonTitle: String { get }
    
    /// The notification permission cancel button title.
    var buttonTitleFont: UIFont { get }
    
    /// Determines whether to present the pre-permission alert.
    var presentPrePermissionAlert: Bool { get }
    
    /// Determines whether to present the denied alert.
    var presentDeniedAlert: Bool { get }
    
    /// Determines whether to present the disabled alert.
    var presentDisabledAlert: Bool { get }
}
