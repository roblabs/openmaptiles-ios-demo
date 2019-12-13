//
//  OSM2VectorTilesTests.swift
//  OSM2VectorTilesTests
//
//  Created by Rob Labs on 12/13/19.
//  Copyright © 2019 Klokan Technologies GmbH. All rights reserved.
//

import XCTest

class OSM2VectorTilesTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMap() {
        
        app.doubleTap()
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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
