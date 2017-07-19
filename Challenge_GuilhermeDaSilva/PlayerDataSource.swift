//
//  PlayerDataSource.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//
import UIKit
protocol PlayerDataSource {
    
    var title: String { get }
    var name: String { get }
    var imageCover: UIImage { get }
    var imageBackgound: UIImage { get }
    var imageButton: UIImage { get }
    
}

