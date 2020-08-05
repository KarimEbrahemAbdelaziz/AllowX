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
        
        let configuration = CustomCameraConfiguration()
        let permission: AllowX = AllowX(type: .camera, configuration: configuration)
        
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

