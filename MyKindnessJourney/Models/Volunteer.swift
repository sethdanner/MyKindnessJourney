//
//  Volunteer.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

struct Volunteer: Codable {
    
    var organizationName: String
    var volunteerTitle: String
    var streetAddress: String
    var city: String
    var state: String
    var zip: String
    var link: String
    var description: String
    var category: String
    var date: String?
    var id: String?
}

//extension URL {
//    func withQueries(_ queries: [String: String]) -> URL? {
//        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
//        components?.queryItems = queries.compactMap
//            { URLQueryItem(name: $0.0, value: $0.1) }
//        return components?.url
//    }
//}
