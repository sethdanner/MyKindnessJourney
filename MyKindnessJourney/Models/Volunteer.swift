//
//  Volunteer.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

struct VolunteerJSONDictionary: Codable {
    let opportunities: [Volunteer]
}

struct Volunteer: Codable {
    
    var organizationName: String
    var name: String
    var city: String
    var state: String
    var zip: String
    var organizationName_url: String
    var shortDescription: String
    var date: String?
    var url: String
}

//extension URL {
//    func withQueries(_ queries: [String: String]) -> URL? {
//        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
//        components?.queryItems = queries.compactMap
//            { URLQueryItem(name: $0.0, value: $0.1) }
//        return components?.url
//    }
//}
