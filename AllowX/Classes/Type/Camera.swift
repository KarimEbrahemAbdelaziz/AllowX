//
//  Camera.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import AVFoundation

extension AllowX {
    var statusCamera: AllowXStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch status {
        case .authorized:          return .authorized
        case .restricted, .denied: return .denied
        case .notDetermined:       return .notDetermined
        @unknown default:          return .notDetermined
        }
    }

    func requestCamera(_ callback: @escaping Callback) {
        guard let _ = Bundle.main.object(forInfoDictionaryKey: .cameraUsageDescription) else {
            print("WARNING: \(String.cameraUsageDescription) not found in Info.plist")
            return
        }

        AVCaptureDevice.requestAccess(for: .video) { _ in
            callback(self.statusCamera)
        }
    }
}
