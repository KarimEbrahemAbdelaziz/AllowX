//
//  DisabledAlert.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
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
        guard let type = type else {
            return nil
        }
        
        switch type {
        case .camera:
            return UIImage(named: "img_graphics_no_search_results_1", in: Bundle(for: AllowX.self), compatibleWith: nil)
        case .locationAlways, .locationWhenInUse:
            return UIImage(named: "img_graphics_map", in: Bundle(for: AllowX.self), compatibleWith: nil)
        case .notifications:
            return UIImage(named: "img_graphics_notification", in: Bundle(for: AllowX.self), compatibleWith: nil)
        }
    }
    
    /// The title of the alert.
    open var title: String? {
        guard let type = type else {
            return nil
        }
        
        switch type {
        case .camera:
            return "Camera Access"
        case .locationAlways, .locationWhenInUse:
            return "Location Access"
        case .notifications:
            return "Notification Access"
        }
    }

    /// Descriptive text that provides more details about the reason for the alert.
    open var message: String? {
        guard let type = type else {
            return nil
        }
        
        switch type {
        case .camera:
            return "To capture awesome photos of you."
        case .locationAlways, .locationWhenInUse:
            return "Please enable location access to use this feature"
        case .notifications:
            return "Enable push notifications to let send you personal news and updates"
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
            return "Cancel"
        case .disabled:
            return "Cancel"
        case .notDetermined:
            return "Not Now"
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
            return "Go to Settings"
        case .disabled:
            return "Go to Settings"
        case .notDetermined:
            return "Enable"
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
        layer.cornerRadius = 5
        configure()
    }
    
    private func configure() {
        self.iconImageView.image = image
        self.titleLabel.text = title
        self.messageLabel.text = message
        self.dismissButton.setTitle(cancel, for: .normal)
        self.doneButton.setTitle(confirm, for: .normal)
    }
    
    @IBAction private func dismissButtonTapped(_ sender: Any) {
        SwiftEntryKit.dismiss()
    }
    
    @IBAction private func doneButtonTapped(_ sender: Any) {
        callbacks?(status!)
        SwiftEntryKit.dismiss()
    }

}
