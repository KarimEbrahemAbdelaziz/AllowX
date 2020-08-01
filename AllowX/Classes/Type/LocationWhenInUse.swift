//
//  LocationWhenInUse.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import CoreLocation

extension AllowX {
    var statusLocationWhenInUse: AllowXStatus {
        guard CLLocationManager.locationServicesEnabled() else { return .disabled }

        let status = CLLocationManager.authorizationStatus()

        switch status {
        case .authorizedWhenInUse, .authorizedAlways: return .authorized
        case .restricted, .denied:                    return .denied
        case .notDetermined:                          return .notDetermined
        @unknown default:                             return .notDetermined
        }
    }

    func requestLocationWhenInUse(_ callback: Callback) {
        guard let _ = Foundation.Bundle.main.object(forInfoDictionaryKey: .locationWhenInUseUsageDescription) else {
            print("WARNING: \(String.locationWhenInUseUsageDescription) not found in Info.plist")
            return
        }

        LocationManager.request(self)
    }
}
