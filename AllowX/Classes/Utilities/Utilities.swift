//
// Utilities.swift
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
