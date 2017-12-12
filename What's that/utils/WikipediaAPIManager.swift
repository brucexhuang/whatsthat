//
//  WikipediaAPIManager.swift
//  What's that
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//

import Foundation
import UIKit

protocol WikepediaResultDelegate{
    func wikipediaResultFound(wikipediaResults: WikipediaResults)
    func wikipediaResultNotFound()
}

class WikipediaManager {
    
    var delegate:WikepediaResultDelegate?
    
    func fetchWikepediaResults(label: String){
        //print(label)
        var wikipediaResults = WikipediaResults(extract: "")
        var detailResult = ""
        var urlComponents = URLComponents(string: "https://en.wikipedia.org/w/api.php?")!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "prop", value: "extracts"),
            URLQueryItem(name: "exintro", value: ""),
            URLQueryItem(name: "explaintext", value: ""),
            URLQueryItem(name: "titles", value: "\(label)"),
        ]
        
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //check for valid response with 200 (success)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                self.delegate?.wikipediaResultNotFound()
                print("@@@@@@@@@@@")
                return
            }
            
            guard let data = data, let responses = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] ?? [String:Any]() else {
                self.delegate?.wikipediaResultNotFound()
                print("############")
                
                return
            }
            
            
            
            guard let responseJsonObject = responses["query"] as? [String:Any], let pageJsonObject = responseJsonObject["pages"] as? [String:Any] else {
                self.delegate?.wikipediaResultNotFound()
                print("%%%%%%%%%%%%")
                return
            }
            
            var pageid = ""
            for item in pageJsonObject{
                pageid = item.key
            }
            
            guard let pageidJsonObject = pageJsonObject[pageid] as? [String:Any] else {
                self.delegate?.wikipediaResultNotFound()
                print("^^^^^^^^^^^^^")
                return
            }
            
//            guard let extractJsonObject = pageidJsonObject["extract"] as? [String:Any] else {
//                self.delegate?.wikipediaResultNotFound()
//                print("1111111111111111")
//                return
//            }
            
            
            for item in pageidJsonObject{
                if(item.key == "extract"){
                    detailResult = item.value as! String
                }
            }
            
            print("333333333333", detailResult)
            let result = WikipediaResults(extract: detailResult)
   
            
            self.delegate?.wikipediaResultFound(wikipediaResults: result)
        }
        
        task.resume()
        
    }
}
