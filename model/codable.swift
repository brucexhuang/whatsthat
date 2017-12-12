//
//  codable.swift
//  What's that
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//
import Foundation

struct Root: Codable{
    let responses: [Responses]
}

struct Responses: Codable{
    let labelAnnotations: [LabelAnnotations]
}

struct LabelAnnotations: Codable{
    let mid: String
    let description: String
    let score: Double
}
