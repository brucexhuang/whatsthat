//
//  GoogleVisionResults.swift
//  What's that
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//

import Foundation

struct GoogleVisionResults: Decodable{
    let description: String
    let score: String
    
    enum CodingKeys: String, CodingKey{
        case description
        case score
    }
}
