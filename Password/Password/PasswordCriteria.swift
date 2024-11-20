//
//  PasswordCriteria.swift
//  Password
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import Foundation

struct PasswordCriteria {
    static func lenghtCriteriaMet(_ text: String) -> Bool {
         text.count >= 8 && text.count <= 32
    }
    
    static func noSpacesMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespacesAndNewlines) == nil
    }
    
    static func lengthAnsNoSpace(_ text: String) -> Bool {
        lenghtCriteriaMet(text) && noSpacesMet(text)
    }
    
    static func upperCaseMet(_ text: String) -> Bool {
        text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    static func lowercaseMet(_ text: String) -> Bool {
        text.range(of: "[a-z]+", options: .regularExpression) != nil
    }

    static func digitMet(_ text: String) -> Bool {
        text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    static func specialCharMet(_ text: String) -> Bool {
        text.range(of: "[!@#$%^]+", options: .regularExpression) != nil
    }
}
