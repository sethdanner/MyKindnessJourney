//
//  QuoteOfDay.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

struct JSONDictionary: Decodable {
    let contents: Content
}

struct Content: Decodable {
    let quotes: [Quote]
    let copyright: String
}

struct Quote: Decodable {
    let quote: String
    let author: String
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case quote 
        case author
        case copyright
    }
}
