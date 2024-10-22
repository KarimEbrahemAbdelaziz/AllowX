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
    
    /// The permission configuration.
    internal let configuration: AllowXConfiguration
    
    /// The pre-permission alert.
    lazy var prePermissionAlert: PrePermissionAlert = {
        return PrePermissionAlert(permission: self, configuration: configuration)
    }()
    
    /// The alert when the permission was denied.
    lazy var deniedAlert: DeniedAlert = {
        return DeniedAlert(permission: self, configuration: configuration)
    }()
    
    /// The alert when the permission is disabled.
    lazy var disabledAlert: DisabledAlert = {
        return DisabledAlert(permission: self, configuration: configuration)
    }()
    
    var callback: Callback?
    
    private var attributes: EKAttributes {
        var attributes = EKAttributes()
        attributes = .centerFloat
        attributes.scroll = .disabled
        attributes.screenBackground = .color(color: .dimmedLightBackground)
        attributes.displayMode = .light
        attributes.hapticFeedbackType = .success
        attributes.displayDuration = .infinity
        attributes.screenInteraction = .absorbTouches
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
            height: configuration.alertHeight
        )
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: UIScreen.main.minEdge),
            height: configuration.alertHeight
        )
        attributes.statusBar = .ignored
        return attributes
    }
    
    /**
     Creates and return a new permission for the specified type.
     
     - parameter type: The permission type.
     
     - returns: A newly created permission.
     */
    public init(type: AllowXType, configuration: AllowXConfiguration? = nil) {
        self.type = type
        guard let configuration = configuration else {
            switch type {
            case .camera:
                self.configuration = DefaultAllowXCameraConfiguration()
            case .locationAlways, .locationWhenInUse:
                self.configuration = DefaultAllowXLocationConfiguration()
            case .notifications:
                self.configuration = DefaultAllowXNotificationConfiguration()
            }
            return
        }
        
        self.configuration = configuration
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
            configuration.presentPrePermissionAlert ? showPrePermissionAlert() : requestAuthorization(callbacks)
        case .denied:
            configuration.presentDeniedAlert ? showDeniedAlert() : callbacks(status)
        case .disabled:
            configuration.presentDisabledAlert ? showDisabledAlert() : callbacks(status)
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
