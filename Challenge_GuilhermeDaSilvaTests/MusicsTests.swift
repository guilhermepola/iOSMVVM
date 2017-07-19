//
//  MusicsTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva

class MusicsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldNotNil(){
        let arrayTest = [["mp3": "test0"],
                         ["mp3": "test1"],
                         ["mp3": "test2"],
                         ["mp3": "test3"]]
        let music = Musics.init(arrayJson: arrayTest)
       
        XCTAssertNotNil(music)
        XCTAssertEqual(music?.musics.count, 4)
        XCTAssertEqual(music?.musics[0], "test0")


    }
    func testShouldBeNil(){
        let arrayTest = [["notFound": "test0"],
                         ["notFound": "test1"],
                         ["notFound": "test2"],
                         ["notFound": "test3"]]
        let music = Musics.init(arrayJson: arrayTest)
        XCTAssertEqual(music?.musics.count, 0)



    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
