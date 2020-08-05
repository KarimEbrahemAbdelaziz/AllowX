//
// DisabledAlert.swift
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

import UIKit
import SwiftEntryKit

class DisabledAlert: UIView {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var dismissButton: LinkButton!
    @IBOutlet private weak var doneButton: PrimaryButton!
    
    /// The permission.
    fileprivate var permission: AllowX?

    /// The status of the permission.
    fileprivate var status: AllowXStatus? { return permission?.status }

    /// The type of the permission.
    private var type: AllowXType? { return permission?.type }

    fileprivate var callbacks: AllowX.Callback? { return permission?.callbacks }

    /// The image of the alert.
    open var image: UIImage? {
        guard let image = permission?.image else {
            guard let type = type else {
                return nil
            }
            
            switch type {
            case .camera:
                return permission?.cameraPermissionImage
            case .locationAlways, .locationWhenInUse:
                return permission?.locationPermissionImage
            case .notifications:
                return permission?.notificationPermissionImage
            }
        }
        
        return image
    }
    
    /// The title of the alert.
    open var title: String? {
        guard let type = type else {
            return nil
        }
        
        switch type {
        case .camera:
            return permission?.title ?? "Camera Access"
        case .locationAlways, .locationWhenInUse:
            return permission?.title ?? "Location Access"
        case .notifications:
            return permission?.title ?? "Notification Access"
        }
    }

    /// Descriptive text that provides more details about the reason for the alert.
    open var message: String? {
        guard let type = type else {
            return nil
        }
        
        switch type {
        case .camera:
            return permission?.message ?? "To capture awesome photos of you."
        case .locationAlways, .locationWhenInUse:
            return  permission?.message ?? "Please enable location access to use this feature"
        case .notifications:
            return  permission?.message ?? "Enable push notifications to let us send you personal news and updates"
        }
    }

    /// The title of the cancel action.
    open var cancel: String? {
        guard let status = status else {
            return nil
        }
        
        switch status {
        case .authorized:
            return nil
        case .denied:
            return permission?.cancelButtonTitle ?? "Cancel"
        case .disabled:
            return permission?.cancelButtonTitle ?? "Cancel"
        case .notDetermined:
            return permission?.notNowButtonTitle ?? "Not Now"
        }
    }

    /// The title of the confirm action.
    open var confirm: String? {
        guard let status = status else {
            return nil
        }
        
        switch status {
        case .authorized:
            return nil
        case .denied:
            return permission?.goToSettingsButtonTitle ?? "Go to Settings"
        case .disabled:
            return permission?.goToSettingsButtonTitle ?? "Go to Settings"
        case .notDetermined:
            return permission?.confirmButtonTitle ?? "Allow"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    init(permission: AllowX) {
        super.init(frame: .zero)
        
        self.permission = permission
        setup()
    }
    
    private func setup() {
        fromNib()
        
        clipsToBounds = true
        layer.cornerRadius = 16
        configure()
    }
    
    private func configure() {
        self.iconImageView.image = image
        self.titleLabel.text = title
        self.titleLabel.font = permission?.titleFont
        self.titleLabel.textColor = permission?.titleColor
        self.messageLabel.text = message
        self.messageLabel.font = permission?.messageFont
        self.messageLabel.textColor = permission?.messageColor
        self.dismissButton.setTitle(cancel, for: .normal)
        self.dismissButton.titleLabel?.font = permission?.buttonTitleFont
        self.doneButton.setTitle(confirm, for: .normal)
        self.doneButton.titleLabel?.font = permission?.buttonTitleFont
    }
    
    @IBAction private func dismissButtonTapped(_ sender: Any) {
        SwiftEntryKit.dismiss()
    }
    
    @IBAction private func doneButtonTapped(_ sender: Any) {
        callbacks?(status!)
        SwiftEntryKit.dismiss()
    }

}
