//
//  QuoteOfTheDayController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class QuoteController {
    
    var baseURL = URL(string: "https://quotes.rest/qod.json?category=inspire")!
    
    func fetchQuote(completion: @escaping(Quote?) -> Void) {
        
        let url = baseURL
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let data = data {
                
                print(data)
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let jsonDictionary = try jsonDecoder.decode(JSONDictionary.self, from: data)
                    let quoteArray = jsonDictionary.contents.quotes
                    let copyright = jsonDictionary.contents.copyright
                    guard var returnQuote = quoteArray.first else { return }
                    returnQuote.copyright = copyright
                    completion(returnQuote)
                    print("asdf")
                } catch let error {
                    print(error)
                    completion(nil); return
                }
            }
        }
        dataTask.resume()
        print(url)
    }
}
