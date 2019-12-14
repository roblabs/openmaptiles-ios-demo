//
//  OSM2VectorTilesUITests.swift
//  OSM2VectorTilesUITests
//
//  Created by Rob Labs on 12/13/19.
//  Copyright © 2019 ePi Rational, Inc.. All rights reserved.
//

import XCTest

class OSM2VectorTilesUITests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInfo() {
        app/*@START_MENU_TOKEN@*/.buttons["About this map"]/*[[".otherElements[\"Map\"].buttons[\"About this map\"]",".buttons[\"About this map\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sheets["Mapbox Maps SDK for iOS"].scrollViews.otherElements.buttons["Cancel"].tap()
    }
    
    func testCompass() {
        for _ in 0...5 {
            app.doubleTap()
        }
        app.rotate(1.0, withVelocity: 1.0)
        
        app/*@START_MENU_TOKEN@*/.buttons["Compass"]/*[[".otherElements[\"Map\"].buttons[\"Compass\"]",".buttons[\"Compass\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testMap() {
        app.rotate(1.0, withVelocity: 1.0)
        app.pinch(withScale: 0.5, velocity: -0.5)
        app.doubleTap()

        app.pinch(withScale: 1.5, velocity: 5.0)
        app.swipeLeft()
        app.tap()
        app.pinch(withScale: 0.5, velocity: -0.5)
        app.swipeLeft()
        app.swipeLeft()
        app.pinch(withScale: 5.5, velocity: 5.0)
        app.tap()
        app.swipeDown()
        app.swipeDown()
        app.swipeUp()
    }

    func testExample() {
        // UI tests must launch the application that they test.

        let app = XCUIApplication()

        /// Place a breakpoint on the next line, then in the debugger issue the command `po app` and inspect.  E.g., `app.otherElements["Map"]``
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
