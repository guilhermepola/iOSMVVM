//
//  UIImageViewExtensionTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva
struct UIImageViewMock{
    
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let imageView = UIImageView()
    init() {
        imageView.frame = rect
    }
    
    
}

class UIImageViewExtensionTests: XCTestCase {
    
    var imageViewMock: UIImageViewMock?

    
    override func setUp() {
        super.setUp()
        self.imageViewMock = UIImageViewMock()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testShouldNotChangeValues(){
        XCTAssertEqual(self.imageViewMock?.imageView.subviews.count, 0)
        XCTAssertEqual(self.imageViewMock?.imageView.layer.cornerRadius, 0.0)
        XCTAssertEqual(self.imageViewMock?.imageView.layer.masksToBounds, false)

    }
    func testShouldBeCornerRadiusHalAndMaskTrue(){
        self.imageViewMock?.imageView.setRounded()
        XCTAssertEqual(self.imageViewMock?.imageView.layer.cornerRadius, 50.0)
        XCTAssertEqual(self.imageViewMock?.imageView.layer.masksToBounds, true)
    
    }
    func testShouldBeCornerRadiusSameValue(){
        self.imageViewMock?.imageView.setRadius(with: 10.0)
        XCTAssertEqual(self.imageViewMock?.imageView.layer.cornerRadius, 10.0)
        XCTAssertEqual(self.imageViewMock?.imageView.layer.masksToBounds, true)


    }
    func testUIImageViewShouldHasBlur(){
        self.imageViewMock?.imageView.blur()
        XCTAssertEqual(self.imageViewMock?.imageView.subviews.count, 1)
    }
    

    
}
