//
//  Notifications.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import AVFoundation
import UserNotifications

extension AllowX {
    var statusNotifications: AllowXStatus {
        if Defaults.requestedNotifications {
            return synchronousStatusNotifications
        }

        return .notDetermined
    }

    func requestNotifications(_ callback: Callback) {
        guard case .notifications(let options) = type else { fatalError() }

        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            Defaults.requestedNotifications = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.callbacks(self.statusNotifications)
            }
        }
    }

    private var synchronousStatusNotifications: AllowXStatus {
        let semaphore = DispatchSemaphore(value: 0)

        var status: AllowXStatus = .notDetermined

        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized: status = .authorized
            case .denied: status = .denied
            case .notDetermined: status = .notDetermined
            case .provisional: status = .authorized
            @unknown default: status = .notDetermined
            }

            semaphore.signal()
        }

        _ = semaphore.wait(timeout: .distantFuture)

        return status
    }
}
