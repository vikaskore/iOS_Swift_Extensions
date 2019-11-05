//
//  UILabel+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    //To change font of supplied string
    
    func differentFontOf(fullText : String , changeText : String, fontName: String, fontSize: CGFloat) {
        let str: NSString = fullText as NSString
        let range = (str).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(.font, value: UIFont(name: fontName, size: fontSize)! , range: range)
        self.attributedText = attribute
    }
    
    //To change color of supplied string
    
    func differentTextColorOf(fullText : String , changeText : String, color: UIColor) {
        let str: NSString = fullText as NSString
        let range = (str).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedText = attribute
    }
    
    //To change color of strings in the array
    
    func differentStringArrayColorOf(fullText : String , changeTextArray : [String], color: UIColor) {
        let strNumber: NSString = fullText as NSString
        let attribute = NSMutableAttributedString.init(string: fullText)
        for str in changeTextArray {
            let range = (strNumber).range(of: str)
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        self.attributedText = attribute
    }
}
