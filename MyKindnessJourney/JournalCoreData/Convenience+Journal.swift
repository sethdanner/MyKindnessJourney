//
//  Convenience+Journal.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CoreData

extension Journal {
    
    convenience init(title: String, body: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.title = title
        self.body = body
        self.date = Date()
    }
}
