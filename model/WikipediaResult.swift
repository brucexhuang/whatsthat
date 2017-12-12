//
//  WikipediaResult.swift
//  What's that
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//

import Foundation

class WikipediaResults: NSObject {
    
    let extract: String

    
    let extractKey = "extract"

    
    init(extract: String) {
        
        self.extract = extract
    }
    
    required init?(coder aDecoder: NSCoder) {
        extract = aDecoder.decodeObject(forKey: extractKey) as! String
    }
}

extension WikipediaResults: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(extract, forKey: extractKey)
    }
}
