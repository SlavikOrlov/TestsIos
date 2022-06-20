//
//  FieldValidator.swift
//  TestsIos
//
//  Created by Slava Orlov on 20.06.2022.
//

import Foundation
import UIKit

protocol FieldValidator {
    
    func validateLoginTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool
    
}

class FieldValidatorImpl: FieldValidator {
    
    func validateLoginTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool {
        
        return loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
    }
}
