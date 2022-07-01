//
//  TestsIosUITests.swift
//  TestsIosUITests
//
//  Created by Slava Orlov on 01.07.2022.
//

import XCTest

class TestsIosUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")

        app/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"next\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.textFields["PasswordTF"].typeText("password")
        
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"done\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.alerts["Warning"].descendants(matching: .staticText)["Invalid Fields"].waitForExistence(timeout: 1.0))
        
    }

    func testNextScreenExistsAfterLogin() throws {

        let app = XCUIApplication()
        app.launch()
        
        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")

        app/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"next\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.textFields["PasswordTF"].typeText("password123")
        
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"done\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.navigationBars["Main"].waitForExistence(timeout: 1.0))
    }
    
    
}
