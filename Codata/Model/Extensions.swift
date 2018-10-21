//
//  Extensions.swift
//  Codata
//
//  Created by Kevin Trebossen on 21/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        
        let formatter = DateFormatter()     // formateur
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
    
    
    
}
