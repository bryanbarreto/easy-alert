//
//  AlertStyle.swift
//  
//
//  Created by Bryan Barreto on 27/03/21.
//

import Foundation


enum AlertStyle: String {
    case success = "✅"
    case warning = "⚠️"
    case error = "❌"
    case none = ""
    
    var value: String {
        return self.rawValue
    }
}
