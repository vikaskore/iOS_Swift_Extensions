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
    var isIPv4: Bool {
        var sin = sockaddr_in()
        return self.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) }) == 1
    }
    
    var isIPv6: Bool {
        var sin6 = sockaddr_in6()
        return self.withCString({ cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) }) == 1
    }
    
    var isValidIPAddress: Bool {
        return self.isIPv6 || self.isIPv4
    }
    
    var trimText: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var isValidUserName: Bool {
       let RegEx = "^\\w{7,18}$"
       let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
       return Test.evaluate(with: self)
    }

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
    
    var isAlphanumeric: Bool {
        return range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isAlphaOnly: Bool{
        let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: self)
        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        return alphabet
    }
    
    var isNumeric: Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    var isValidPinCode: Bool {
        return !self.isEmpty && self.isNumeric && self.count == 6
    }
    
    public func firstCharacters(separator: String = "") -> String {
        var str = ""
        let acronyms = separator.components(separatedBy: " ")
        guard acronyms.count > 1 else { return separator }
        acronyms.forEach { (str1) in
            if let char1 = str1.first {
                str.append(char1)
            }
        }
        return str.isEmpty ? separator : str
    }
    
    func camelCaseToWords() -> String {
        
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + " " + String($1))
            } else {
                return $0 + String($1)
            }
        }
    }
    
    func addSpacesInCapitalLetters() -> String{
        var string = self
        
        //indexOffset is needed because each time replaceSubrange is called, the resulting count is incremented by one (owing to the fact that a space is added to every capitalised letter)
        var indexOffset = 0
        for (index, character) in string.enumerated(){
            let stringCharacter = String(character)
            
            //Evaluates to true if the character is a capital letter
            if stringCharacter.lowercased() != stringCharacter{
                guard index != 0 else { continue } //"ILoveSwift" should not turn into " I Love Swift"
                let stringIndex = string.index(string.startIndex, offsetBy: index + indexOffset)
                let endStringIndex = string.index(string.startIndex, offsetBy: index + 1 + indexOffset)
                let range = stringIndex..<endStringIndex
                indexOffset += 1
                string.replaceSubrange(range, with: " \(stringCharacter)")
            }
        }
        return string
    }
    
    //Calculate time ago from given date
       func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
           let calendar = NSCalendar.current
           let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
           let now = NSDate()
           let earliest = now.earlierDate(date as Date)
           let latest = (earliest == now as Date) ? date : now
           let components = calendar.dateComponents(unitFlags, from: earliest as Date,  to: latest as Date)
           
           if (components.year! >= 2) {
               return "\(components.year!) years ago"
           } else if (components.year! >= 1){
               if (numericDates){
                   return "1 year ago"
               } else {
                   return "Last year"
               }
           } else if (components.month! >= 2) {
               return "\(components.month!) months ago"
           } else if (components.month! >= 1){
               if (numericDates){
                   return "1 month ago"
               } else {
                   return "Last month"
               }
           } else if (components.weekOfYear! >= 2) {
               return "\(components.weekOfYear!) weeks ago"
           } else if (components.weekOfYear! >= 1){
               if (numericDates){
                   return "1 week ago"
               } else {
                   return "Last week"
               }
           } else if (components.day! >= 2) {
               return "\(components.day!) days ago"
           } else if (components.day! >= 1){
               if (numericDates){
                   return "1 day ago"
               } else {
                   return "Yesterday"
               }
           } else if (components.hour! >= 2) {
               return "\(components.hour!) hours ago"
           } else if (components.hour! >= 1){
               if (numericDates){
                   return "1 hour ago"
               } else {
                   return "An hour ago"
               }
           } else if (components.minute! >= 2) {
               return "\(components.minute!) minutes ago"
           } else if (components.minute! >= 1){
               if (numericDates){
                   return "1 minute ago"
               } else {
                   return "A minute ago"
               }
           } else if (components.second! >= 3) {
               return "\(components.second!) seconds ago"
           } else {
               return "Just now"
           }
           
       }

       // MARK:- Localization
       // Localised string for different languages
       var localized: String {
           if let languageCode = (UserData.returnValue(.appLanguage) as? [String])?.first, let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj"), let custBundle = Bundle.init(path: languageDirectoryPath) {
               return NSLocalizedString(self, tableName: nil, bundle: custBundle, value: "", comment: "")
           }
           return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
       }
       
       /// Height of TextView
       func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
           let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
           let boundingBox = self.boundingRect(with: constraintRect, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
           
           return boundingBox.height
       }
       
       func emojiToImage() -> UIImage? {
           let size = CGSize(width: 30, height: 35)
           UIGraphicsBeginImageContextWithOptions(size, false, 0)
           UIColor.clear.set()
           let rect = CGRect(origin: CGPoint(), size: size)
           UIRectFill(CGRect(origin: CGPoint(), size: size))
           (self as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return image
       }
       
       /// Encode And Decode Emoji Code To string and vise-varsa
       func decode() -> String {
           let data = self.data(using: .utf8) ?? Data()
           return String(data: data, encoding: .nonLossyASCII) ?? self
       }
       
       func encode() -> String {
           let data = self.data(using: .nonLossyASCII, allowLossyConversion: true)!
           return String(data: data, encoding: .utf8) ?? ""
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
    
    func toGlobalDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ")-> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
    }
}
