//
//  UIImageView+Extension.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

extension UIImageView {
    func setRounded(){
       setRadius(with: Float(self.frame.width / 2))
    }
    func setRadius(with radius: Float) {
        let radius = radius
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.masksToBounds = true
    }
    
    func blur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
