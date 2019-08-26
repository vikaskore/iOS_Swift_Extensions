//
//  Dictionary+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    func contains(key: Key) -> Bool {
        let value = self.contains { (k,_) -> Bool in key == k }
        return value
    }
}
