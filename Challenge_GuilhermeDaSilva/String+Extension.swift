//
//  String+Extension.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 30/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

extension String {
    
    enum SegueIdentifier: String {
        case seguePlayer
    }
    
    init(segueIdentifier: SegueIdentifier) {
        self.init(segueIdentifier.rawValue)!
    }
    
    enum MetadataKey: String {
        case albumName
        case artist
        case artwork

    }

    init(metadaKey: MetadataKey){
        self.init(metadaKey.rawValue)!
        
    }
    
}

