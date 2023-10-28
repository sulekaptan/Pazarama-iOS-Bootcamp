//
//  SwiftUnitTestlerUITests.swift
//  SwiftUnitTestlerUITests
//
//  Created by Şule Kaptan on 28.10.2023.
//

import XCTest

final class SwiftUnitTestlerUITests: XCTestCase {
    
    func testAddToDoItem() throws {
        let app = XCUIApplication()
        app.launch() //app'i açar.

        let addButton = app.navigationBars["SwiftUnitTestler.View"].buttons["Item"]

        let textField = app.alerts["To Do Item"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["To do giriniz."]/*[[".cells.textFields[\"To do giriniz.\"]",".textFields[\"To do giriniz.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let okButton = app.alerts["To Do Item"].scrollViews.otherElements.buttons["OK"]
        
        let addedRow = app.tables.staticTexts["my to do"]
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        XCTAssertTrue(addedRow.exists)

    }
    
    
    func testDeleteToDoItem() throws {
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["SwiftUnitTestler.View"].buttons["Item"]

        let textField = app.alerts["To Do Item"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["To do giriniz."]/*[[".cells.textFields[\"To do giriniz.\"]",".textFields[\"To do giriniz.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let okButton = app.alerts["To Do Item"].scrollViews.otherElements.buttons["OK"]
        
        let addedRow = app.tables.staticTexts["my to do"]
        
        let tableView = app.tables
        let deleteButton = tableView.buttons["Delete"]
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        
        addedRow.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedRow.exists)
        
    }
    

    //testlerden önce yapılması gerekenleri yapar.
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    //test bittikten sonra yapılacak bir işlem varsa bunları yapar.
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    //test fonksiyonlarının ismi test ile başlamalıdır.
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

}
