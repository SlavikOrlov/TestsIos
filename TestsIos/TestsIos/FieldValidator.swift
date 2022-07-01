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
    
    func asyncvalidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void)

}

class FieldValidatorImpl: FieldValidator {
    
    func validateLoginTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool {
        
        return loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
    }
    
    func asyncvalidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void) {
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5, execute: {
            
            DispatchQueue.main.async {
                let result = loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
                
                completion(result)
            }
        })
    }
}
