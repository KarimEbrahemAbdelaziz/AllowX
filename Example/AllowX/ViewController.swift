//
//  ViewController.swift
//  AllowX
//
//  Created by KarimEbrahem on 08/01/2020.
//  Copyright (c) 2020 KarimEbrahem. All rights reserved.
//

import UIKit
import AllowX

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllowX.primaryColor = .systemPink
        
        let permission: AllowX = AllowX(type: .camera)
        
        permission.image = UIImage(named: "camera")
        permission.title = "Camera Custom Access"
        permission.message = "Please give us permission to capture your awesome moments."
        permission.cancelButtonTitle = "Cancel"
        permission.notNowButtonTitle = "Not now"
        permission.goToSettingsButtonTitle = "Go to Settings"
        permission.confirmButtonTitle = "Allow Permission"
        
        permission.presentPrePermissionAlert = true
        permission.presentDeniedAlert = true
        permission.presentDisabledAlert = true
        
        permission.request { status in
            switch status {
            case .authorized:    print("authorized")
            case .denied:        print("denied")
            case .disabled:      print("disabled")
            case .notDetermined: print("not determined")
            }
        }
    }
    
}

