//
//  QuoteOfDay.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

//struct Quote: Decodable {
//
//    let contents: Quotes
//}
//
//struct Quotes: Decodable {
//
//    let quotes: QuotesDictionary
//}

//struct Quotes: Decodable {
//
//    let text: String
//    let author: String
//    let imageURL: URL
//    let copyright: String
//
//    //let content: String
//    let quoteContents: ContentsDictionary
//    //let quotes: [Quotes]
//
//    enum CodingKeys: String, CodingKey {
//        //case content = "contents"
//
//        case text = "quote"
//        case author = "author"
//        case imageURL = "background"
//        case copyright = "copyright"
//    }
//}
//
//struct ContentsDictionary: Decodable, Equatable {
//    let contents: String
//
//    enum CodingKeys: String, CodingKey {
//        case contents = "contents"
//    }
//}

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
    let backgroundImageURLString: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case quote 
        case author
        case backgroundImageURLString = "background"
        case copyright
    }
}



