//
//  ModulesFactory.swift
//  TestsIos
//
//  Created by Slava Orlov on 20.06.2022.
//

import Foundation
import UIKit

protocol ModulesFactory {
    
    func getModule(by type: Modules) -> UIViewController

}

enum Modules {
    case main
}

class ModulesFactoryImpl: ModulesFactory {
    
    func getModule(by type: Modules) -> UIViewController {
        switch type {
        case .main:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController")
        }
    }
}
