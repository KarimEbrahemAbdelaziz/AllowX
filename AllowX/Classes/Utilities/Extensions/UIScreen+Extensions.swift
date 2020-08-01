//
//  UIScreen+Extensions.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import UIKit

extension UIScreen {
    var minEdge: CGFloat {
        return UIScreen.main.bounds.minEdge
    }
}

extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}
