//
//  TestsIosTests.swift
//  TestsIosTests
//
//  Created by Slava Orlov on 21.06.2022.
//

import XCTest
@testable import TestsIos

class TestsIosTests: XCTestCase {
    
    var fieldValidator: FieldValidator!

    override func setUpWithError() throws {
        
        fieldValidator = FieldValidatorImpl()
    }

    override func tearDownWithError() throws {
        
        fieldValidator = nil
    }

    func testValidatorCorrectWithEmptyValues() throws {
        
        //Given
        let loginTf = UITextField()
        let passwordTf = UITextField()
        let expectedResult = false
        var validateResult: Bool
        
        //When
        validateResult = fieldValidator.validateLoginTextFields(loginTF: loginTf, passwordTF: passwordTf)

        //Then
        XCTAssertEqual(expectedResult, validateResult)
    }
    
    func testValidatorCorrectWithValues() throws {
        
        //Given
        let loginTf = UITextField()
        loginTf.text = "login"
        let passwordTf = UITextField()
        passwordTf.text = "password"
        
        let expectedResult = false
        var validateResult: Bool
        
        //When
        validateResult = fieldValidator.validateLoginTextFields(loginTF: loginTf, passwordTF: passwordTf)

        //Then
        XCTAssertEqual(expectedResult, validateResult)
    }
    
    

    func testPerformanceExample() throws {

        measure {

        }
    }

}
