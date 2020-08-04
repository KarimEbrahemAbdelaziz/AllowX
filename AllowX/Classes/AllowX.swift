//
// AllowX.swift
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
import UserNotifications

public class AllowX: NSObject {
    public typealias Callback = (AllowXStatus) -> Void
    
    /// The permission domain.
    public let type: AllowXType
    
    /// The permission status.
    public var status: AllowXStatus {
        switch type {
        case .locationAlways: return statusLocationAlways
        case .locationWhenInUse: return statusLocationWhenInUse
        case .notifications: return statusNotifications
        case .camera: return statusCamera
        }
    }
    
    /// The primaryColor for confirm button background color.
    public static var primaryColor: UIColor = UIColor.systemBlue
    
    /// The camera permission default image.
    internal let cameraPermissionImage: UIImage = UIImage(named: "img_graphics_no_search_results_1", in: Bundle(for: AllowX.self), compatibleWith: nil)!
    
    /// The location permission default image.
    internal let locationPermissionImage: UIImage = UIImage(named: "img_graphics_map", in: Bundle(for: AllowX.self), compatibleWith: nil)!
    
    /// The notification permission default image.
    internal let notificationPermissionImage: UIImage = UIImage(named: "img_graphics_notification", in: Bundle(for: AllowX.self), compatibleWith: nil)!
    
    /// The permission image.
    public var image: UIImage?
    
    /// The notification permission title.
    public var title: String?
    
    /// The notification permission message.
    public var message: String?
    
    /// The notification permission cancel button title.
    public var cancelButtonTitle: String?
    
    /// The notification permission not now button title.
    public var notNowButtonTitle: String?
    
    /// The notification permission go to settings button title.
    public var goToSettingsButtonTitle: String?
    
    /// The notification permission allow button title.
    public var confirmButtonTitle: String?
    
    /// Determines whether to present the pre-permission alert.
    public var presentPrePermissionAlert = true
    
    /// The pre-permission alert.
    lazy var prePermissionAlert: PrePermissionAlert = {
        return PrePermissionAlert(permission: self)
    }()
    
    /// Determines whether to present the denied alert.
    public var presentDeniedAlert = true
    
    /// The alert when the permission was denied.
    lazy var deniedAlert: DeniedAlert = {
        return DeniedAlert(permission: self)
    }()
    
    /// Determines whether to present the disabled alert.
    public var presentDisabledAlert = true
    
    /// The alert when the permission is disabled.
    lazy var disabledAlert: DisabledAlert = {
        return DisabledAlert(permission: self)
    }()
    
    var callback: Callback?
    
    private var attributes: EKAttributes {
        var attributes = EKAttributes()
        attributes = .centerFloat
        attributes.screenBackground = .color(color: .dimmedLightBackground)
        attributes.displayMode = .light
        attributes.hapticFeedbackType = .success
        attributes.displayDuration = .infinity
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.5,
                spring: .init(damping: 0.9, initialVelocity: 0)
            ),
            scale: .init(
                from: 0.8,
                to: 1,
                duration: 0.5,
                spring: .init(damping: 0.8, initialVelocity: 0)
            ),
            fade: .init(
                from: 0.7,
                to: 1,
                duration: 0.3
            )
        )
        attributes.exitAnimation = .init(
            translate: .init(
                duration: 0.5
            ),
            scale: .init(
                from: 1,
                to: 0.8,
                duration: 0.5
            ),
            fade: .init(
                from: 1,
                to: 0,
                duration: 0.5
            )
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(
                    duration: 0.3
                ),
                scale: .init(
                    from: 1,
                    to: 0.8,
                    duration: 0.3
                )
            )
        )
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.1,
                radius: 6
            )
        )
        attributes.positionConstraints.verticalOffset = 10
        attributes.positionConstraints.size = .init(
            width: .offset(value: 20),
            height: .intrinsic
        )
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: UIScreen.main.minEdge),
            height: .intrinsic
        )
        attributes.statusBar = .ignored
        return attributes
    }
    
    /**
     Creates and return a new permission for the specified type.
     
     - parameter type: The permission type.
     
     - returns: A newly created permission.
     */
    public init(type: AllowXType) {
        self.type = type
    }
    
    /**
     Requests the permission.
     
     - parameter callback: The function to be triggered after the user responded to the request.
     */
    public func request(_ callback: @escaping Callback) {
        self.callback = callback
        
        let status = self.status
        
        switch status {
        case .authorized:
            callbacks(status)
        case .notDetermined:
            presentPrePermissionAlert ? showPrePermissionAlert() : requestAuthorization(callbacks)
        case .denied:
            presentDeniedAlert ? showDeniedAlert() : callbacks(status)
        case .disabled:
            presentDisabledAlert ? showDisabledAlert() : callbacks(status)
        }
    }
    
    func requestAuthorization(_ callback: @escaping Callback) {
        switch type {
        case .locationAlways: requestLocationAlways(callback)
        case .locationWhenInUse: requestLocationWhenInUse(callback)
        case .notifications: requestNotifications(callback)
        case .camera: requestCamera(callback)
        }
    }
    
    func callbacks(_ with: AllowXStatus) {
        DispatchQueue.main.async {
            self.callback?(self.status)
        }
    }
    
    func showPrePermissionAlert() {
        SwiftEntryKit.display(entry: prePermissionAlert, using: attributes)
    }
    
    func showDeniedAlert() {
        SwiftEntryKit.display(entry: deniedAlert, using: attributes)
    }
    
    func showDisabledAlert() {
        SwiftEntryKit.display(entry: disabledAlert, using: attributes)
    }
    
}
