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
        
        let permission: AllowX = .camera

        print(permission.status) // .notDetermined

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

