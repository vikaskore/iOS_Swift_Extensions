//
//  Collection+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    
    @discardableResult
    mutating func remove(_ item: Element) -> Array {
        if let index = firstIndex(where: { item == $0 }) {
            remove(at: index)
        }
        return self
    }
    
    @discardableResult
    mutating func removeAll(_ item: Element) -> Array {
        removeAll(where: { item == $0 })
        return self
    }
}


