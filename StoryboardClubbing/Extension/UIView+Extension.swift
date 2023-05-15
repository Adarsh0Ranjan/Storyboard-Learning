//
//  UIVIew+Extension.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 15/05/23.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable  var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
