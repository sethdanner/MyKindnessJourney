//
//  VolunteerController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/6/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import FirebaseDatabase

class VolunteerController {
    
    // MARK: Properties
    static var shared = VolunteerController()
    var volunteerOpportunities: [Volunteer] = []
    
    let baseURL = URL(string: "https://volunteertwo-a7f89.firebaseio.com/name")!
//    let baseURL = URL(string: "https://volunteeringopportunitiesapi.firebaseio.com/opportunities")!
    
    func fetchVolunteerOpportunities(with searchTerm: String, completion: @escaping(Bool) -> Void) {

        let url = baseURL.appendingPathExtension("json")
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let data = data {
                
                print(data)
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let volunteerDictionary = try jsonDecoder.decode([Volunteer].self, from: data)
                    self.volunteerOpportunities = volunteerDictionary
                    completion(true)
                    print(data)
                    
                } catch let error {
                    print(error)
                    completion(false); return
                }
            }
        }
        dataTask.resume()
        print("🧠 \(url)")
    }
    
//        func postVolunteerOpportunity(organizationName: String, name: String, city: String, state: String, zip: String, organizationName_url: String, shortDescription: String, date: String, url: String, completion: @escaping(Bool) -> Void) {
//
//            let volunteerOpportunity = Volunteer(organizationName: organizationName, name: name, city: city, state: state, zip: zip, organizationName_url: organizationName_url, shortDescription: shortDescription, date: date, url: url)
//            let url = baseURL.appendingPathExtension("json")
//
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//
//            let jsonEncoder = JSONEncoder()
//            request.httpBody = try? jsonEncoder.encode(volunteerOpportunity)
//
//            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
//
//                if let data = data {
//                    self.volunteerOpportunities.append(volunteerOpportunity)
//                    completion(true)
//                }
//                if let error = error {
//                    print(error)
//                    completion(false); return
//                }
//            }
//            task.resume()
//        }
}
