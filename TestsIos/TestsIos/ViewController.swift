//
//  ViewController.swift
//  TestsIos
//
//  Created by Slava Orlov on 20.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var modulesFactory = ModulesFactoryImpl()
    var fieldValidator = FieldValidatorImpl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.returnKeyType = .continue
        passwordTF.returnKeyType = .done
        
        loginTF.delegate = self
        passwordTF.delegate = self
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case loginTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            passwordTF.resignFirstResponder()
            
            guard fieldValidator.validateLoginTextFields(loginTF: loginTF, passwordTF: passwordTF) else {
                
                let alert = UIAlertController(title: "Warning", message: "Invalid Fields", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
                
                break
            }
            toNextScreen()
            
        default: break
        }
        return true
    }
    
    func toNextScreen() {
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        else {
            return
        }
        
        let screen = modulesFactory.getModule(by: .main)
        
        sceneDelegate.window?.rootViewController = screen
        sceneDelegate.window?.makeKeyAndVisible()
        
    }
}

