//
//  JournalControllerCK.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/14/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CloudKit

class JournalEntryController {
    
    // MARK: Properties
    static var shared = JournalEntryController()
    var journalEntries: [JournalEntry] = []
    
    // MARK: CRUD Functions
    // Create
    func createNewJournalEntry(with title: String, body: String, completion: @escaping (Bool) -> Void) {
        
        let newJournalEntry = JournalEntry(title: title, body: body)
        
        let journalEntryRecord = CKRecord(journalEntry: newJournalEntry)
        
        CloudKitManager.shared.save(recordsToSave: [journalEntryRecord]) { (error) in
            if let error = error {
                print("😩There was an error saving the record to CloudKit: \(error) \(error.localizedDescription)😢")
                completion(false)
                return
            }
            
            self.journalEntries.append(newJournalEntry)
            completion(true)
        }
    }
    
    // Update
    func updateJournalEntry(journalEntry: JournalEntry, title: String, body: String, completion: @escaping (Bool) -> Void) {
        
        journalEntry.title = title
        journalEntry.body = body
        
        let updatedJournalEntryRecord = CKRecord(journalEntry: journalEntry)
        
        CloudKitManager.shared.save(recordsToSave: [updatedJournalEntryRecord]) { (error) in
            if let error = error {
                print("There was an error updating the record on CloudKit: \(error.localizedDescription)")
                completion(false)
            }
            
            completion(true)
        }
    }
    
    // Delete
    func deleteJournalEntry(journalEntry: JournalEntry, completion: @escaping (Bool) -> Void) {
        
        guard let journalEntryRecordID = journalEntry.cloudKitRecordID else { completion(false) ; return}
        
        CloudKitManager.shared.delete(recordIDsToDelete: [journalEntryRecordID]) { (error) in
            if let error = error {
                print("There was an error deleting the record from CloudKit: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let index = self.journalEntries.index(of: journalEntry) else { completion(false) ; return }
            self.journalEntries.remove(at: index)
            completion(true)
        }
    }
    
    // MARK: Fetch Records From CloudKit
    func fetchAllJournalEntries(completion: @escaping (Bool) -> Void) {
        
        let predicate = NSPredicate(value: true)
        
        CloudKitManager.shared.fetchRecords(withRecordType: Constants.journalEntryTypeKey, predicate: predicate) { (journalEntryRecords, error) in
            if let error = error {
                print("There was an error fetching records from CloudKit: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // Convert the records received into journalEntry model objects
            guard let journalEntryRecords = journalEntryRecords else { completion(false) ; return }
            
            for journalEntryRecord in journalEntryRecords {
                guard let journalEntry = JournalEntry(ckRecord: journalEntryRecord) else { continue }
                self.journalEntries.append(journalEntry)
                
            }
            completion(true)
        }
    }
}
