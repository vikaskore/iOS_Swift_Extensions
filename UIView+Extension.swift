//
//  UIView+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    ///Set Corner radius
    func setRoundWCorner() {
        layer.cornerRadius = self.frame.width * 0.5
    }
    
    func setRoundHCorner() {
        layer.cornerRadius = self.frame.height * 0.5
    }
    
    func setCorner(withRadius radii: CGFloat = 5.0) {
        layer.cornerRadius = radii
    }
    
    @available(iOS 11.0, *)
    func setCorner(_ cornerMask: CACornerMask, radius: CGFloat) {
        self.clipsToBounds = false
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cornerMask
    }
    
    func setCorner(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    func setBorder(withColor color: UIColor = .clear, borderWidth width: CGFloat = 0, cornerRadius radius: CGFloat? = nil) {
        self.layer.borderWidth = width
        if let radius = radius {
            self.layer.cornerRadius = radius
        }
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }

    
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: [0.0 , 1.0])
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.addSublayer(gradient)
    }
    
    /*func round(corners: UIRectCorner, radius: CGFloat) {
     let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
     let mask = CAShapeLayer()
     mask.path = path.cgPath
     self.layer.mask = mask
     }*/
    
    func animateButtonDown() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    func animateButtonUp() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    ///Set Gradient layer to View with color, location, radius and frame
    func applyGradient(colours: [UIColor], locations: [NSNumber]? = nil, cornerRadi: CGFloat = 5.0, withFrame: CGRect? = nil) -> Void {
        self.backgroundColor = UIColor.clear
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = withFrame ?? self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = locations
        gradient.cornerRadius = cornerRadi
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    ///Get AttributedString
    func setTextFieldAttributes(withStrPlaceholder Name: String, clr: UIColor , isMandatory: Bool = false) -> NSMutableAttributedString {
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: clr, range:NSRange(location:0,length: Name.count))
        if isMandatory {
            let text = "*"
            let range = (text as NSString).range(of: "*")
            var attributedString = NSMutableAttributedString()
            attributedString = NSMutableAttributedString(string:text, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13)])
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
            placeHolder.append(attributedString)
        }
        return placeHolder
    }
    
    func getAttributesText(str1: String, str2: String, clr1: UIColor, clr2: UIColor, font1: UIFont = UIFont.systemFont(ofSize: 13), font2: UIFont = UIFont.systemFont(ofSize: 13)) -> NSMutableAttributedString {
        
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(string:str1, attributes: [NSAttributedString.Key.font: font1])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: clr1, range: NSRange(location:0, length: str1.count))
        
        let text = str2
        let range = (str2 as NSString).range(of: str2)
        var attributedString = NSMutableAttributedString()
        attributedString = NSMutableAttributedString(string:text, attributes: [NSAttributedString.Key.font: font2])
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: clr2 , range: range)
        placeHolder.append(attributedString)
        
        return placeHolder
    }
    
    /// Shadow related Methods
    func setShadowWithCornerRadius(corners: CGFloat, clr: UIColor = UIColor.gulPurpleColor, rect: CGRect? = nil) {
        self.layer.cornerRadius = corners
        let shadowPath2 = UIBezierPath(rect: rect ?? self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = clr.cgColor
        self.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath2.cgPath
        self.layer.shadowRadius = 7
    }
    
    func addInerShadowLayer() {
        clipsToBounds = true
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect: CGRect(x: -10, y: -self.frame.height/2, width: self.frame.width + 20, height: self.frame.height*2), cornerRadius: 0)
        let buttonPath = UIBezierPath(roundedRect: CGRect(x: -1, y: -1, width: self.frame.width+2, height: self.frame.height+2), cornerRadius: self.frame.height/2)
        path.append(buttonPath.reversing())
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
        shapeLayer.shadowOpacity = 0.1
        shapeLayer.shadowColor = UIColor.gulPurpleColor.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLayer.shadowRadius = 5
    }
    
    
    enum VerticalLocation: String {
        case bottom
        case top
    }
    
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 5), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -5), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func applyShadow(apply: Bool, color: UIColor = UIColor.black, offset: CGSize = CGSize(width: 2, height: 2), opacity: Float = 0.2, radius: Float = 1, shadowRect: CGRect? = nil) {
        layer.shadowColor = apply ? color.cgColor : UIColor.white.withAlphaComponent(0.0).cgColor
        layer.shadowOffset = apply ? offset : CGSize(width: 0, height: 0)
        layer.shadowOpacity = apply ? opacity : 0
        layer.shadowRadius = apply ? CGFloat(radius) : 0
        layer.masksToBounds = false
        if let shadowRect = shadowRect {
            layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        }
    }
    
    /// Get View Screen ShotImage
    func screenShot()-> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// Animate View
    func shake(count: Float = 4, for duration: TimeInterval = 0.5, withTranslation translation: Float = 5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
    
    func shake(fromPoint: CGPoint? = nil, toPoint: CGPoint? = nil) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: fromPoint ?? CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: toPoint ?? CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    /// Parallax effect for View
    func addParallaxToView(minX: CGFloat = -30, maxX: CGFloat = 30, minY: CGFloat = -30, maxY: CGFloat = 30) {
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = minX
        horizontal.maximumRelativeValue = maxX
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = minY
        vertical.maximumRelativeValue = maxY
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        self.addMotionEffect(group)
    }
    
    // MARK:- Localization
    /// For English
    func leftToRight() {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        //CosmosView.appearance().semanticContentAttribute = .forceLeftToRight
        UISwitch.appearance().semanticContentAttribute = .forceLeftToRight
        UITextField.appearance().textAlignment = NSTextAlignment.left
        UITextView.appearance().textAlignment = NSTextAlignment.left
        UILabel.appearance().textAlignment = NSTextAlignment.left
        //resetStringAsPerLocalization()
    }
    
    /// For Arabic
    func rightToLeft(){
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UISwitch.appearance().semanticContentAttribute = .forceRightToLeft
        //CosmosView.appearance().semanticContentAttribute = .forceRightToLeft
        UITextField.appearance().textAlignment = NSTextAlignment.right
        UITextView.appearance().textAlignment = NSTextAlignment.right
        UILabel.appearance().textAlignment = NSTextAlignment.right
        //resetStringAsPerLocalization()
    }
    
    func flipView(){
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
    

}
