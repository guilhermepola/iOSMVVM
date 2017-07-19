//
//  LoadingView.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

class LoadingView: BasicPopView{

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureView(){
        titleLabel.text = "Loading..."
        containerView.layer.cornerRadius = CGFloat(20.0)
        containerView.layer.masksToBounds = true
        resultImageView.isHidden = true
        loadingIndicator.isHidden = false
    }

    override func removeAnimate() {
        
        titleLabel.text = "Music found!"
        resultImageView.isHidden = false
        loadingIndicator.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
            super.removeAnimate()
        })
    }
}
