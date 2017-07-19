//
//  ViewController.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
class PlayerViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageViewCover: UIImageView!
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playOrPauseButton: UIButton!
    
    
    fileprivate var dataSource: PlayerDataSource?
    
    var viewModel: PlayerViewModel = PlayerViewModel()
    var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMusic()

    }
    override func viewWillDisappear(_ animated: Bool) {
        viewModel.audioPlayer?.stop()
    }
    func configureMusic(){
        
        viewModel.playMusicRandom()
        schedule()
        viewModel.configurateMusicData()
        configure(viewModelDataSource: viewModel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configure(viewModelDataSource: PlayerDataSource){
        
        dataSource = viewModelDataSource
        
        musicLabel.text = viewModelDataSource.name
        nameLabel.text = viewModelDataSource.title
        imageViewCover.image = viewModelDataSource.imageCover
        imageViewCover.setRadius(with: 10.0)
        imageViewBackground.image = viewModelDataSource.imageBackgound
        imageViewBackground.blur()
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        
        sender.setImage(viewModel.changeImageButton(), for:.normal)
    }
    
    
    @IBAction func stop(_ sender: UIButton) {
        stopMusic()
    }
    

    func stopMusic(){
        viewModel.stopMusic()
        progressView.progress = 0
        playOrPauseButton.setImage(#imageLiteral(resourceName: "play-button"), for:.normal)

    }
    
    //pragma MARK: Method update Progress
    func updateProgress(){
        let duration = viewModel.durationProgress()
        if duration != 0.0{
            self.progressView.setProgress(viewModel.durationProgress(), animated: true)
        }else{
            stopMusic()
        }
        
        
    }
    
    func schedule() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self,
                                              selector: #selector(self.updateProgress), userInfo: nil, repeats: true)
            
        }
    }
}

