//
//  LocationAlways.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import CoreLocation

extension AllowX {
    var statusLocationAlways: AllowXStatus {
        guard CLLocationManager.locationServicesEnabled() else { return .disabled }

        let status = CLLocationManager.authorizationStatus()

        switch status {
        case .authorizedAlways: return .authorized
        case .authorizedWhenInUse:
            return Defaults.requestedLocationAlwaysWithWhenInUse ? .denied : .notDetermined
        case .notDetermined: return .notDetermined
        case .restricted, .denied: return .denied
        @unknown default: return .notDetermined
        }
    }

    func requestLocationAlways(_ callback: Callback) {
        guard let _ = Foundation.Bundle.main.object(forInfoDictionaryKey: .locationAlwaysUsageDescription) else {
            print("WARNING: \(String.locationAlwaysUsageDescription) not found in Info.plist")
            return
        }

        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            Defaults.requestedLocationAlwaysWithWhenInUse = true
        }

        LocationManager.request(self)
    }
}
