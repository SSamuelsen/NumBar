//
//  ButtonDesign.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 6/29/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {  //@IBInspectable allows to change in the storyboard
        
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    
    
}
