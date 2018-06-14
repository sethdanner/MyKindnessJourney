//
//  VolunteerController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/6/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

class VolunteerController {
    
    var volunteerOpportunities: [Volunteer] = []
    
    let baseURL = URL(string: "https://volunteeringopportunitiesapi.firebaseio.com/opportunities")!
    
    func fetchVolunteerOpportunities(completion: @escaping(Bool) -> Void) {
        
        let url = baseURL.appendingPathExtension("json")
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let data = data {
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let volunteerDictionary = try jsonDecoder.decode(Dictionary<String, Volunteer>.self, from: data)
                    self.volunteerOpportunities = Array(volunteerDictionary.values)
                    completion(true)
                    
                } catch let error {
                    print(error)
                    completion(false); return
                }
            }
        }
        dataTask.resume()
        print(url)
    }
    
    func postVolunteerOpportunity(organizationName: String, volunteerTitle: String, streetAddress: String, city: String, state: String, zip: String, link: String, description: String, category: String, date: String, id: String, completion: @escaping(Bool) -> Void) {
        
        let volunteerOpportunity = Volunteer(organizationName: organizationName, volunteerTitle: volunteerTitle, streetAddress: streetAddress, city: city, state: state, zip: zip, link: link, description: description, category: category, date: date, id: id)
        
        let url = baseURL.appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let jsonEncoder = JSONEncoder()
        request.httpBody = try? jsonEncoder.encode(volunteerOpportunity)
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let data = data {
                self.volunteerOpportunities.append(volunteerOpportunity)
                completion(true)
            }
            if let error = error {
                print(error)
                completion(false); return
            }
        }
        task.resume()
    }
}
