//
//  LoadingViewTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva
class LoadingViewMock: LoadingView{
    //MusicLabel
    let stubbedTitleLabel: UILabel! = UILabel()
    override var titleLabel: UILabel! {
        get {
            return stubbedTitleLabel
        }
        set {
            
        }
    }
    
    let stubbedContainerView: UIView! = UIView()
    override var containerView: UIView! {
        get {
            return stubbedContainerView
        }
        set {
            
        }
    }
    
    let stubbedLoadingIndicator: UIActivityIndicatorView! = UIActivityIndicatorView()
    override var loadingIndicator: UIActivityIndicatorView! {
        get {
            return stubbedLoadingIndicator
        }
        set {
            
        }
    }
   
    let stubbedResultImageView: UIImageView! = UIImageView()
    override var resultImageView: UIImageView! {
        get {
            return stubbedResultImageView
        }
        set {
            
        }
    }
    
    
}
class LoadingViewTests: XCTestCase {
    
    var loading: LoadingViewMock?
    override func setUp() {
        super.setUp()
        loading = LoadingViewMock()
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCompareAfterMethodConfigureView(){
        XCTAssertNil(loading?.titleLabel.text)
        XCTAssertEqual(loading?.containerView.layer.cornerRadius, 0.0)
        XCTAssertEqual(loading?.containerView.layer.masksToBounds, false)
        XCTAssertEqual(loading?.resultImageView.isHidden, false)
        XCTAssertEqual(loading?.loadingIndicator.isHidden, true)

        loading?.configureView()
        XCTAssertNotNil(loading?.titleLabel.text)
        XCTAssertEqual(loading?.titleLabel.text, "Loading...")
        
        XCTAssertEqual(loading?.containerView.layer.cornerRadius, 20.0)
        XCTAssertEqual(loading?.containerView.layer.masksToBounds, true)
        
        XCTAssertEqual(loading?.resultImageView.isHidden, true)
        XCTAssertEqual(loading?.loadingIndicator.isHidden, false)
        
    }
    
    
    func testCompareAfterMethodRemoveAnimate(){
        XCTAssertNil(loading?.titleLabel.text)
        XCTAssertEqual(loading?.containerView.layer.cornerRadius, 0.0)
        XCTAssertEqual(loading?.containerView.layer.masksToBounds, false)
        XCTAssertEqual(loading?.resultImageView.isHidden, false)
        XCTAssertEqual(loading?.loadingIndicator.isHidden, true)
        
        loading?.removeAnimate()
        
        XCTAssertNotNil(loading?.titleLabel.text)
        XCTAssertEqual(loading?.titleLabel.text, "Music found!")
        
        
        XCTAssertEqual(loading?.resultImageView.isHidden, false)
        XCTAssertEqual(loading?.loadingIndicator.isHidden, true)
 
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
