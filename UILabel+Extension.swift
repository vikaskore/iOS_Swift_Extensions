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
    func differentFontOf(fullText : String , changeText : String, fontName: String, fontSize: CGFloat) {
        let str: NSString = fullText as NSString
        let range = (str).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(.font, value: UIFont(name: fontName, size: fontSize)! , range: range)
        self.attributedText = attribute
    }
    
    func differentTextColorOf(fullText : String , changeText : String, color: UIColor) {
        let str: NSString = fullText as NSString
        let range = (str).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedText = attribute
    }
}
