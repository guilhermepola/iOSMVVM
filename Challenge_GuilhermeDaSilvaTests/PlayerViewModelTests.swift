//
//  PlayerViewModelTests.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import XCTest
@testable import Challenge_GuilhermeDaSilva
struct PlayerViewModelMock{
    let playerVM = PlayerViewModel()
    
}

class PlayerViewModelTests: XCTestCase {
    
    var viewModelMock: PlayerViewModelMock?
    override func setUp() {
        super.setUp()
        
        self.viewModelMock = PlayerViewModelMock()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldGetMusics(){
        let musicsMock = self.viewModelMock?.playerVM.getMusics()
        let musics = Musics.init(arrayJson: FileReader(fileName: "urls").arrayJSON)
        
        XCTAssertNotNil(musics)
        XCTAssertNotNil(musicsMock)
        
        XCTAssertEqual(musics!.musics, musicsMock!.musics)
        XCTAssertEqual(musics!.musics.count, musicsMock!.musics.count)
        
    }
    func testShouldGetMusicRandom(){
        
        let music = self.viewModelMock?.playerVM.getRandomMusic()
        XCTAssertNotNil(music)
        XCTAssertEqual(music, self.viewModelMock?.playerVM.currentMusic)
        
    }
    func testShouldPlayMusic(){
        XCTAssertNil(self.viewModelMock?.playerVM.audioPlayer)
        self.viewModelMock?.playerVM.playMusicRandom()
        XCTAssertNotNil(self.viewModelMock?.playerVM.audioPlayer)
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.isPlaying, true)
        
        
    }
    func testShouldReturnDuration(){
        XCTAssertNil(self.viewModelMock?.playerVM.audioPlayer)
        let durationError = self.viewModelMock?.playerVM.durationProgress()
        XCTAssertEqual(durationError, 0.0)

        self.viewModelMock?.playerVM.playMusicRandom()
        XCTAssertNotNil(self.viewModelMock?.playerVM.audioPlayer)

        let duration = self.viewModelMock?.playerVM.durationProgress()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            XCTAssertNotEqual(duration, 0.0)
        })
    }
    func testShouldStopMusic(){
        XCTAssertNil(self.viewModelMock?.playerVM.audioPlayer)
        self.viewModelMock?.playerVM.playMusicRandom()
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.isPlaying, true)
        
        self.viewModelMock?.playerVM.stopMusic()
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.isPlaying, false)
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.currentTime, 0)

    }
    func testShouldConfigureData(){
        let player = self.viewModelMock?.playerVM

        XCTAssertEqual(player?.title, "Not found")
        XCTAssertEqual(player?.name, "Not found")
        XCTAssertEqual(player?.imageCover, #imageLiteral(resourceName: "nophoto"))
        XCTAssertEqual(player?.imageBackgound, #imageLiteral(resourceName: "photo"))
        XCTAssertEqual(player?.imageButton, #imageLiteral(resourceName: "pause"))

        let musics = Musics.init(arrayJson: FileReader(fileName: "urls").arrayJSON)
        let pathAudio = Bundle.main.url(forResource: musics?.musics[1], withExtension: "mp3")!

        self.viewModelMock?.playerVM.currentMusic = pathAudio
        self.viewModelMock?.playerVM.configurateMusicData()
        

        XCTAssertEqual(player?.title, "Pouring water into")
        XCTAssertEqual(player?.name, "Maria")
        XCTAssertEqual(player?.imageBackgound, #imageLiteral(resourceName: "photo"))
        XCTAssertEqual(player?.imageButton, #imageLiteral(resourceName: "pause"))
        

        
    }
    
    func testShouldChangeImageButtonPlayAndStop(){
        XCTAssertEqual(self.viewModelMock?.playerVM.imageButton, #imageLiteral(resourceName: "pause"))
        
        self.viewModelMock?.playerVM.playMusicRandom()
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.isPlaying, true)

        let image = self.viewModelMock?.playerVM.changeImageButton()
        XCTAssertEqual(image, #imageLiteral(resourceName: "play-button"))
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.isPlaying, false)
        
        let newImage = self.viewModelMock?.playerVM.changeImageButton()
        XCTAssertEqual(newImage, #imageLiteral(resourceName: "pause"))
        XCTAssertEqual(self.viewModelMock?.playerVM.audioPlayer?.isPlaying, true)

    }
    

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
