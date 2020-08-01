//
//  Utilities.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation

extension Bundle {
    var name: String {
        return object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
    }
}

extension UIControl.State: Hashable {
    public var hashValue: Int { return Int(rawValue) }
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct Defaults {
    @UserDefault("permission.requestedNotifications", defaultValue: false)
    static var requestedNotifications: Bool

    @UserDefault("permission.requestedLocationAlwaysWithWhenInUse", defaultValue: false)
    static var requestedLocationAlwaysWithWhenInUse: Bool
}

extension String {
    static let locationWhenInUseUsageDescription = "NSLocationWhenInUseUsageDescription"
    static let locationAlwaysUsageDescription    = "NSLocationAlwaysUsageDescription"
    static let cameraUsageDescription            = "NSCameraUsageDescription"
}

extension OperationQueue {
    convenience init(_ qualityOfService: QualityOfService) {
        self.init()
        self.qualityOfService = qualityOfService
    }
}

extension NotificationCenter {
    func addObserver(_ observer: AnyObject, selector: Selector, name: NSNotification.Name?) {
        addObserver(observer, selector: selector, name: name!, object: nil)
    }

    func removeObserver(_ observer: AnyObject, name: NSNotification.Name?) {
        removeObserver(observer, name: name, object: nil)
    }
}
