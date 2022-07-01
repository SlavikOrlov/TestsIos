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
    
    func testAsyncValidatorCorrectWithValues() throws {
        
        //Given
        
        let loginTf = UITextField()
        loginTf.text = "login"
        let passwordTf = UITextField()
        passwordTf.text = "password"
        
        let expectedResult = false
        var validateResult: Bool?
        let validatorExpectation = expectation(description: "Expectation in " + #function)
        
        
        //When
        
        fieldValidator.asyncvalidateLoginTextFields(loginTF: loginTf, passwordTF: passwordTf) { (isValid) in
            
            validateResult = isValid
                        
            validatorExpectation.fulfill()

        }

        //Then
        
        waitForExpectations(timeout: 2.0) { (error) in
            
            if error != nil {
                XCTFail()
            }
            
            XCTAssertEqual(expectedResult, validateResult)
        }
    }
}
 
