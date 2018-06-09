//
//  Volunteer.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

class Volunteer: Codable {
    
    var organizationName: String
    var volunteerTitle: String
    var address: String
    var link: String
    var description: String
    var category: String
    var date: String
    var id: String
    
    init(organizationName: String, volunteerTitle: String, address: String, link: String, description: String, category: String, date: String, id: String) {
        
        self.organizationName = organizationName
        self.volunteerTitle = volunteerTitle
        self.address = address
        self.link = link
        self.description = description
        self.category = category
        self.date = date
        self.id = id
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
