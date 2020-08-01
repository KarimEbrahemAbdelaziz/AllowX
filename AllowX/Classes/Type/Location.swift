//
//  Location.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import CoreLocation

let LocationManager = CLLocationManager()

private var requestedLocation = false
private var triggerCallbacks  = false

extension AllowX: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch (requestedLocation, triggerCallbacks) {
        case (true, false):
            triggerCallbacks = true
        case (true, true):
            requestedLocation = false
            triggerCallbacks  = false
            callbacks(self.status)
        default:
            break
        }
    }
}

extension CLLocationManager {
    func request(_ permission: AllowX) {
        delegate = permission

        requestedLocation = true

        switch permission.type {
        case .locationAlways: requestAlwaysAuthorization()
        case .locationWhenInUse: requestWhenInUseAuthorization()
        default: break
        }
    }
}
