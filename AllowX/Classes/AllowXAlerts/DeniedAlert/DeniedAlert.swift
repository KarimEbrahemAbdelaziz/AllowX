//
// DeniedAlert.swift
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

class DeniedAlert: UIView {
    
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    init(permission: AllowX, configuration: AllowXConfiguration) {
        super.init(frame: .zero)
        
        self.permission = permission
        setup(configuration: configuration)
    }
    
    private func setup(configuration: AllowXConfiguration) {
        fromNib()
        
        clipsToBounds = true
        layer.cornerRadius = 16
        configure(configuration: configuration)
    }
    
    private func configure(configuration: AllowXConfiguration) {
        self.iconImageView.image = configuration.image
        
        setupTitleLabel(configuration: configuration)
        setupMessageLabel(configuration: configuration)
        setupCancelButton(configuration: configuration)
        setupConfirmButton(configuration: configuration)
    }
    
    private func setupTitleLabel(configuration: AllowXConfiguration) {
        guard let status = status else {
            return
        }
        
        switch status {
        case .authorized, .notDetermined:
            self.titleLabel.text = configuration.prePermissionTitle
        case .denied:
            self.titleLabel.text = configuration.deniedTitle
        case .disabled:
            self.titleLabel.text = configuration.disabledTitle
        }
        self.titleLabel.font = configuration.titleFont
        self.titleLabel.textColor = configuration.titleColor
    }
    
    private func setupMessageLabel(configuration: AllowXConfiguration) {
        guard let status = status else {
            return
        }
        
        switch status {
        case .authorized, .notDetermined:
            self.messageLabel.text = configuration.prePermissionMessage
        case .denied:
            self.messageLabel.text = configuration.deniedMessage
        case .disabled:
            self.messageLabel.text = configuration.disabledMessage
        }
        self.messageLabel.font = configuration.messageFont
        self.messageLabel.textColor = configuration.messageColor
    }
    
    private func setupCancelButton(configuration: AllowXConfiguration) {
        guard let status = status else {
            return
        }
        
        switch status {
        case .authorized, .denied, .disabled:
            self.dismissButton.setTitle(configuration.cancelButtonTitle, for: .normal)
        case .notDetermined:
            self.dismissButton.setTitle(configuration.notNowButtonTitle, for: .normal)
        }
        self.dismissButton.titleLabel?.font = configuration.buttonTitleFont
    }
    
    private func setupConfirmButton(configuration: AllowXConfiguration) {
        guard let status = status else {
            return
        }
        
        switch status {
        case .authorized, .notDetermined:
            self.doneButton.setTitle(configuration.confirmButtonTitle, for: .normal)
        case .denied, .disabled:
            self.doneButton.setTitle(configuration.goToSettingsButtonTitle, for: .normal)
        }
        self.doneButton.titleLabel?.font = configuration.buttonTitleFont
    }
    
    @IBAction private func dismissButtonTapped(_ sender: Any) {
        SwiftEntryKit.dismiss()
    }
    
    @IBAction private func doneButtonTapped(_ sender: Any) {
        NotificationCenter.default.addObserver(self, selector: #selector(settingsHandler), name: UIApplication.didBecomeActiveNotification)
        
        if let URL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(URL)
        }
    }
    
    @objc func settingsHandler() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification)
        callbacks?(status!)
        SwiftEntryKit.dismiss()
    }
}
