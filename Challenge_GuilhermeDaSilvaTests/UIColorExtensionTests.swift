//
//  UIColorExtensionTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva

class UIColorExtensionTests: XCTestCase {

    let color = UIColor(red: 248, green: 92, blue: 90)
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testShouldShorRightColor(){
        XCTAssertEqual(color, UIColor.ECRedColor())
    }
    


    
}
