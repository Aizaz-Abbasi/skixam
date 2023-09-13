//
//  UIView+Extensions.swift
//  skixam
//
//  Created by Usman Ramzan on 08/09/2023.
//

import UIKit

extension UIView{
    
  @IBInspectable var CornerRadius: CGFloat{
      get{ return self.CornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
