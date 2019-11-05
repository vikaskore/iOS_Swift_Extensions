//
//  UITextField+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import UIKit
import Foundation

extension UITextField {
    func setLeftPadding(withImg img: UIImage, withTintColor tintColor: UIColor? = nil){
        let imgv = UIImageView(image: img)
        if tintColor  != nil {
            imgv.tintColor = tintColor
        }
        imgv.frame.size = CGSize(width: 30, height: 30)
        imgv.contentMode = .center
        self.leftView = imgv
        self.leftViewMode = .always
    }
    
    func setRightPadding(withImg img: UIImage, withTintColor tintColor: UIColor? = nil){
        let imgv = UIImageView(image: img)
        if tintColor  != nil {
            imgv.tintColor = tintColor
        }
        imgv.frame.size = CGSize(width: 30, height: 30)
        imgv.contentMode = .center
        self.rightView = imgv
        self.rightViewMode = .always
    }
    
    func shake() { //same works for UIView, UIButton UILabel...
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
    
    func spacingPadding(_ padding: PaddingSide) {
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        switch padding {
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            paddingView.backgroundColor = self.backgroundColor
            paddingView.isUserInteractionEnabled = false
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            paddingView.isUserInteractionEnabled = false
            paddingView.backgroundColor = self.backgroundColor
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            paddingView.isUserInteractionEnabled = false
            paddingView.backgroundColor = self.backgroundColor
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}
