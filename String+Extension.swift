//
//  String+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$" //"^[6-9]\\d{9}$" //"^[0-9]{6,14}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: self)
    }
    /*
     Check character count in given string/text is valid or not
     We can modify this by according to need ==, >=, <= etc
     */
    var isValidCharacterCount: Bool {
        return (self.trimmingCharacters(in: .whitespaces).isEmpty) ? false : (self.count == 10) ? true : false
    }
    
    //Using this function user can send valid character count to check
    func isValidCharacterCount(validCount: Int) -> Bool {
        return (self.trimmingCharacters(in: .whitespaces).isEmpty) ? false : (self.count == validCount) ? true : false
    }
    
    /*
     Trim your string from whitespace characters and check if it's empty
     If No text in textbox returns 'false' else 'true'
     */
    var isEmptyField: Bool {
        return (self.trimmingCharacters(in: .whitespaces).isEmpty) ? false : true
    }
    
    // replace spaces with %20 for url string
    func replacingSpacesWithPercentTwenty() -> String {
        return replacingOccurrences(of: " ", with: "%20")
    }
    
    
    // Change color of given text
    func changeColorOfText(changeText : String, changeTextColor : UIColor) -> NSAttributedString{
        let strNumber: NSString = self as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: changeTextColor , range: range)
        return attribute
    }
    
    // Change font of given text
    func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
        let boldFontAttribute = [NSAttributedString.Key.font:boldFont!]
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
        return boldString
    }
    
    // Check occurrences of given string and replace with new one upto given replacement count
    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
        var count = 0
        var returnValue = self
        
        while let range = returnValue.range(of: search) {
            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
            count += 1
            
            // exit as soon as we've made all replacements
            
            if count == maxReplacements {
                return returnValue
            }
        }
        
        return returnValue
    }
    
    // Add prefix to string
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    
    // Add Suffix to string
    func withSuffix(_ suffix : String) -> String{
        if self.hasSuffix(suffix) { return self }
        return "\(self)\(suffix)"
    }

    // Get Last Name, result "", if single word
    func LastName()-> String {
        let strArray = self.components(separatedBy: " ")
        var Lastname = String()
        for str in strArray {
            Lastname = str
        }
        return (strArray.count <= 1 ? "" : Lastname)
    }
    
    // Change foreground color
    func foreGroundColor(Color : UIColor)-> NSAttributedString {
        let strNumber: NSString = self as NSString
        let range = (strNumber).range(of: self)
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: Color , range: range)
        return attribute
    }
    
    // Change backGround color
    func backGroundColor(Color : UIColor)-> NSAttributedString {
        let strNumber: NSString = self as NSString
        let range = (strNumber).range(of: self)
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttribute(NSAttributedString.Key.backgroundColor, value: Color , range: range)
        return attribute
    }
    
    // Change Font
    func ChangeFont(fontName : String, size : CGFloat) -> NSAttributedString{
        let strNumber: NSString = self as NSString
        let range = (strNumber).range(of: self)
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Chalkduster", size: size)!, range: range)
        return attribute
        
    }
    
    // UnderLine to string
    func UnderLine()->NSAttributedString {
        let strNumber: NSString = self as NSString
        let range = (strNumber).range(of: self)
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttribute(NSAttributedString.Key.underlineStyle, value:NSUnderlineStyle.single.rawValue, range: range)
        return attribute
        
    }
    
    // Add shadow to string
    func AddShadow(ShadowColor : UIColor)-> NSAttributedString{
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 5
        myShadow.shadowOffset = CGSize(width: 5, height: 5)
        myShadow.shadowColor = ShadowColor
        
        let strNumber: NSString = self as NSString
        let range = (strNumber).range(of: self)
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttribute(NSAttributedString.Key.shadow, value:myShadow, range: range)
        return attribute
    }
    
    // Convert string to date
    func toDate(withFormat format: String = "yyyy-MM-dd")-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        //dateFormatter.locale = Locale(identifier: "fa-IR")
        //dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        //dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
    }
}
