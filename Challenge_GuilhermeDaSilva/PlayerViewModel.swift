//
//  PlayerViewModel.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit
import AVFoundation
class PlayerViewModel: PlayerDataSource {
    
    var title = "Not found"
    var name = "Not found"
    var imageCover = #imageLiteral(resourceName: "nophoto")
    var imageBackgound = #imageLiteral(resourceName: "photo")
    var currentMusic: URL?
    var imageButton = #imageLiteral(resourceName: "pause")
    
    var audioPlayer: AVAudioPlayer?
    
    func getMusics() -> Musics?{
        
        return Musics.init(arrayJson: FileReader(fileName: "urls").arrayJSON)
        
    }
    func getRandomMusic() -> URL?{
        guard let musics = getMusics()?.musics else{return nil}
        let numberRandom = Int(arc4random_uniform(UInt32((musics.count))))
        let pathAudio = Bundle.main.url(forResource: musics[numberRandom], withExtension: "mp3")!
        currentMusic = pathAudio
        return pathAudio
    }
    
    func playMusicRandom(){
        do {
            guard let urlMusic = getRandomMusic() else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: urlMusic)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            
        } catch let error as NSError {
            print(error.description)
        }
        
        
    }
    
    func durationProgress() -> Float {
        guard let audioPlayer = audioPlayer else {return 0}
        return Float((audioPlayer.currentTime) / (audioPlayer.duration))
    }
    
    func configurateMusicData(){
        
        guard let urlMusic = currentMusic else {return}
        let playerItem = AVPlayerItem(url: urlMusic)
        let metadataList = playerItem.asset.commonMetadata
        for item in metadataList {
            
            if let key = item.commonKey, let value = item.value{
                
                switch key {
                case String(metadaKey: .albumName) : title = (value as? String) ?? title
                case String(metadaKey: .artist): name = value as? String ?? name
                case String(metadaKey: .artwork) where value is Data : imageCover = UIImage(data: (value as! Data)) ?? imageCover
                    
                default: break
                }
            }
        }
        
    }
    
    func stopMusic(){
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
    
    func changeImageButton() -> UIImage {
        
        if !(audioPlayer?.isPlaying ?? true) {
            audioPlayer?.play()
            return #imageLiteral(resourceName: "pause")
            
        }else{
            audioPlayer?.pause()
            return #imageLiteral(resourceName: "play-button")
            
            
        }
        
        
    }
    
}



