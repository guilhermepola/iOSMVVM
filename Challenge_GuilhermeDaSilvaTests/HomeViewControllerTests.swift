//
//  HomeViewControllerTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva
class HomeViewControllerMock: HomeViewController{
    
    let stubbedButton: UIButton! = UIButton()

    
    var calledRandomMusic: Bool?
    override func randomMusic(_ sender: UIButton) {
        
        calledRandomMusic = true
        super.randomMusic(sender)
        
    }
    var calledMotionEnded: Bool?
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        calledMotionEnded = true
        super.motionEnded(motion, with: event)
        
    }
    
    var calledPlayerScreen: Bool?
    override func callPlayerScreen() {
        
        calledPlayerScreen = true
        super.callPlayerScreen()
        
    }
    
    var calledDidReceiveMemoryWarning: Bool?
    override func didReceiveMemoryWarning() {
        
        calledDidReceiveMemoryWarning = true
        super.didReceiveMemoryWarning()
        
    }
    
    
}
class HomeViewControllerTests: XCTestCase {
    
    var viewControllerMock: HomeViewControllerMock?
    
    override func setUp() {
        super.setUp()
     
        viewControllerMock = HomeViewControllerMock()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldCallMethodPlayerScren(){
        XCTAssertNil(viewControllerMock?.calledPlayerScreen)
        viewControllerMock?.randomMusic((viewControllerMock?.stubbedButton)!)
        XCTAssertNotNil(viewControllerMock?.calledPlayerScreen)
        XCTAssertEqual(viewControllerMock?.calledPlayerScreen, true)

    }
    
    func testDidReceiveMemoryWarning(){
        XCTAssertNil(viewControllerMock?.calledDidReceiveMemoryWarning)
        viewControllerMock?.viewDidLoad()
        viewControllerMock?.didReceiveMemoryWarning()
        XCTAssertEqual(viewControllerMock?.calledDidReceiveMemoryWarning, true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
