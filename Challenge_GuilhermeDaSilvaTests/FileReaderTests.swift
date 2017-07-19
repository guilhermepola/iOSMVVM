//
//  FileReaderTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva

class FileReaderTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testReaderNotNil() {
        let testBundle = Bundle(for: type(of: self))
        let mock = FileReader(fileName: "urls", bundle: testBundle)
        XCTAssertNotNil(mock)
        XCTAssertNotNil(mock.arrayJSON)

    }
    func testReaderHas10Elements(){
        let mock = FileReader(fileName: "urls")
        XCTAssertEqual(mock.arrayJSON.count, 9)
    }
    
    func testReaderFakeFile() {
        let testBundle = Bundle(for: type(of: self))
        let fileReader = FileReader(fileName: "FileReaderMock.notFound", bundle: testBundle)
        XCTAssertEqual(fileReader.arrayJSON.count, 0)
        
        let fileReader2 = FileReader(fileName: "FileReaderMock.notFound")
        XCTAssertEqual(fileReader2.arrayJSON.count, 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
