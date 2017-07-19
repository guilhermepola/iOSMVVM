//
//  FileReader.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Ecosia. All rights reserved.
//


import Foundation
struct FileReader {
    
    var arrayJSON = [[String: Any]]()
    
    init(fileName: String, bundle: Bundle = Bundle.main){
        
        
        guard let path = bundle.path(forResource: fileName, ofType: "json") else {
            return
        }
        guard let jsonString = try? NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) else {
            return
        }
        
        
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return
        }
        
        if let arrayJson = json as? [[String: Any]]{
                arrayJSON = arrayJson
            
            return
        }
        
        
    }
    
    
    
}
