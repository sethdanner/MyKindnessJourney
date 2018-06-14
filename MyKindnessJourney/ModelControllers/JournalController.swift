//
//  JournalController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CoreData

class JournalController {
    
    static var shared = JournalController()
    
    // MARK: Fetched Results Controller
    let fetchedResultsController: NSFetchedResultsController<Journal> = {
        
        let request: NSFetchRequest<Journal> = Journal.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    // MARK: CRUD
    func addJournalEntry(with title: String, body: String) {
        
        let _ = Journal(title: title, body: body)
        saveToPersistentStore()
    }
    
    func updateJournalEntry(with entry: Journal, newTitle: String, newBody: String) {
        
        entry.title = newTitle
        entry.body = newBody
        saveToPersistentStore()
    }
    
    func deleteJournalEntry(entry: Journal) {
        
        entry.managedObjectContext?.delete(entry)
        saveToPersistentStore()
    }
    
    // MARK: Persistence
    func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("Error saving entries: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        
        do {
            try fetchedResultsController.performFetch()
        } catch let error {
            print("Error loading entries: \(error.localizedDescription)")
        }
    }
}
