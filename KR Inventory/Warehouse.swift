//
//  Warehouse.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/18/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import Foundation
import UIKit

struct Part{
    let partNumber: String?
    let shelf: String?
    let quantity: Int?
}

class Warehouse{
    static var shelfTierOne = [String]()
    static var shelfTierTwo = [String:[String]]()
    
    static var shelves = [String:[Part]]()
    
    static var orderedShelvesList = [String]()
}

class IQField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
