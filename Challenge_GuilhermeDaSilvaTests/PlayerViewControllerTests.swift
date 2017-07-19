//
//  ViewControllerTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva
class PlayerViewControllerMock: PlayerViewController{
    //MusicLabel
    let stubbedMusicLabel: UILabel! = UILabel()
    override var musicLabel: UILabel! {
        get {
            return stubbedMusicLabel
        }
        set {
            
        }
    }
    
    //nameLabel
    let stubbedNameLabel: UILabel! = UILabel()
    override var nameLabel: UILabel! {
        get {
            return stubbedNameLabel
        }
        set {
            
        }
    }
    
    //imageViewCover
    let stubbedImageViewCover: UIImageView! = UIImageView()
    override var imageViewCover: UIImageView! {
        get {
            return stubbedImageViewCover
        }
        set {
            
        }
    }
    
    //imageViewBackgorund
    let stubbedImageViewBackground: UIImageView! = UIImageView()
    override var imageViewBackground: UIImageView! {
        get {
            return stubbedImageViewCover
        }
        set {
            
        }
    }
    
    //imageViewBackgorund
    let stubbedButtonPlay: UIButton! = UIButton()
    override var playOrPauseButton: UIButton! {
        get {
            return stubbedButtonPlay
        }
        set {
            
        }
        
    }
    
    //progressView
    let stubbedProgressView: UIProgressView! = UIProgressView()
    override var progressView: UIProgressView! {
        get {
            return stubbedProgressView
        }
        set {
            
        }
    }
    
    var calledSchedule: Bool?
    override func schedule() {
        calledSchedule = true
        super.schedule()

    }
    var calledUpdate: Bool?
    override func updateProgress() {
    
        calledUpdate = true
        super.updateProgress()
        
    }

    var calledStop: Bool?
    override func stopMusic(){
        calledStop = true
        super.stopMusic()
        
    }
    var calledDidReceiveMemoryWarning: Bool?
    override func didReceiveMemoryWarning() {
        
        calledDidReceiveMemoryWarning = true
        super.didReceiveMemoryWarning()
        
    }
}
class ViewControllerTests: XCTestCase {
    
    var viewControllerMock: PlayerViewControllerMock?
    var viewModelMock: PlayerViewModel?

    override func setUp() {
        super.setUp()
        viewControllerMock = PlayerViewControllerMock()
        self.viewModelMock = PlayerViewModel()
        viewControllerMock?.viewModel = viewModelMock!

        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfViewDidLoadCallSchedule(){
        viewControllerMock?.viewDidLoad()
        XCTAssertNotNil(viewControllerMock?.calledSchedule)
        XCTAssertEqual(viewControllerMock?.calledSchedule, true)

    }
    func testIfChangeButtonPlay(){
        viewControllerMock?.viewDidLoad()
        viewControllerMock?.viewModel.playMusicRandom()
        viewControllerMock?.play((viewControllerMock?.stubbedButtonPlay)!)
        XCTAssertNotNil(viewControllerMock?.stubbedButtonPlay)

    }
    
    func testIfButtonStopCallMethodStop(){
        XCTAssertNil(viewControllerMock?.calledStop)
        viewControllerMock?.viewDidLoad()
        viewControllerMock?.stop(UIButton())
        XCTAssertNotNil(viewControllerMock?.calledStop)
        XCTAssertEqual(viewControllerMock?.calledStop, true)

        
    }
    
    func testDidReceiveMemoryWarning(){
        XCTAssertNil(viewControllerMock?.calledDidReceiveMemoryWarning)
        viewControllerMock?.viewDidLoad()
        viewControllerMock?.didReceiveMemoryWarning()
        XCTAssertEqual(viewControllerMock?.calledDidReceiveMemoryWarning, true)
    }
    func testShouldStopMusic(){
        self.viewModelMock?.playMusicRandom()
        viewControllerMock?.progressView.progress = 0.5
        viewControllerMock?.stopMusic()
        XCTAssertEqual(viewControllerMock?.progressView.progress, 0.0)

    }
    

    
}
