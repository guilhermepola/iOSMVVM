//
//  BasicPopViewTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva
class BasicPopViewTests: XCTestCase {
    var loading: BasicPopView?

    override func setUp() {
        super.setUp()
        loading = BasicPopView()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testShouldChangePropertyWhenCallShowAnimate(){
        loading?.alpha = 0.0
        loading?.transform =  CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        loading?.showAnimate(completion: { 
            XCTAssertEqual(self.loading?.transform,CGAffineTransform(scaleX: 1.0, y: 1.0))
            XCTAssertEqual(self.loading?.alpha, 1.0)
        })


    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
