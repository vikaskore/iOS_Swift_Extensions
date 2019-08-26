//
//  Date+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    func toString(withFormat format: String = "dd-MM-yy") -> String {
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "fa-IR")
        //dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        //dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        
        return str
    }
    
    func toStringWithYear(withFormat format: String = "dd-MM-yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        
        return str
    }
}

/*
//Get date from timestamp like '2018-10-30T05:48:14.424314Z'

getDateFromTimeStamp(timeStamp: "2018-10-30T05:48:14.424314Z")


// MARK: - Get Date From TimeStamp

func getDateFromTimeStamp(timeStamp : String) {
    
    let str = timeStamp //your timestamp here
    let strArray = str.components(separatedBy: ".")
    
    let str2Array = strArray[0].components(separatedBy: "T")
    let dateString = str2Array[0] + " " + str2Array[1]
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
    //dateFormatter.timeZone = TimeZone.current //local
    let date = dateFormatter.date(from: dateString) // date format
    print(date ?? "") //Convert String to Date
    
    let strDate = stringFromDate(date: date!) // Date to string
    print(strDate)
}

func stringFromDate(date: Date) -> String {
    let formatter = DateFormatter()
    // initially set the format based on your datepicker date / server String
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let myString = formatter.string(from: date) // string purpose I add here
    // convert your string to date
    let yourDate = formatter.date(from: myString)
    //then again set the date format whhich type of output you need
    formatter.dateFormat = "dd-MMM-yyyy"
    // again convert your date to string
    let strDate = formatter.string(from: yourDate!)
    
    return strDate
}
*/
