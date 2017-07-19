//
//  Musics.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

struct Musics{
    
    var musics =  Array<String>()
    
}

extension Musics{
    init?(arrayJson: [[String: Any]]) {
        

        for music in arrayJson{
            guard let mp3 = music["mp3"] as? String else{
                return
            }
            musics.append(mp3)
        }
 
    }
}
