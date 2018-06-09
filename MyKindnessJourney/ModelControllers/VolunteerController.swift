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
    
    let baseURL = URL(string: "https://volunteeringopportunitiesapi.firebaseio.com/")!
    
    func fetchStudents(completion: @escaping(Bool) -> Void) {
        
        let url = baseURL.appendingPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data else { completion(false); return }
            
            do {
                let jsonDecoder = JSONDecoder()
                let jsonDict = try jsonDecoder.decode(Volunteer.self, from: data)
                let volunteerOpportunities = jsonDict.compactMap({$0.value})
                self.volunteerOpportunities = volunteerOpportunities
                completion(true)
                
            } catch let error {
                print(error)
                completion(false); return
            }
        }
        task.resume()
    }
    
    func postVolunteerOpportunity(organizationName: String, volunteerTitle: String, address: String, link: String, description: String, category: String, date: String, id: String, completion: @escaping(Bool) -> Void) {
        
        let volunteerOpportunity = Volunteer(organizationName: organizationName, volunteerTitle: volunteerTitle, address: address, link: link, description: description, category: category, date: date, id: id)
        
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
