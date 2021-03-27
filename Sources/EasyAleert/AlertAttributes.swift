//
//  AlertAttributes.swift
//  
//
//  Created by Bryan Barreto on 27/03/21.
//

import Foundation

enum AlertAttributes: String {
    case title = "attributedTitle"
    case message = "attributedMessage"
    
    var value: String {
        return self.rawValue
    }
}
