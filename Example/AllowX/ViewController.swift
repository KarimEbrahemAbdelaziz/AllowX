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
        
        permission.alertHeight = .constant(value: 400)
        permission.image = UIImage(named: "camera")
        
        permission.title = "Camera Custom Access"
        permission.titleFont = .boldSystemFont(ofSize: 22)
        permission.titleColor = . darkGray
        
        permission.message = "Please give us permission to capture your awesome moments."
        permission.messageFont = .systemFont(ofSize: 16)
        permission.messageColor = .gray
        
        permission.cancelButtonTitle = "Cancel"
        permission.notNowButtonTitle = "Not now"
        permission.goToSettingsButtonTitle = "Go to Settings"
        permission.confirmButtonTitle = "Allow Permission"
        permission.buttonTitleFont = .boldSystemFont(ofSize: 14)
        
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

