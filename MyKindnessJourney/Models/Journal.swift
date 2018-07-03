//
//  Journal.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/14/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CloudKit

class JournalEntry {
    
    // MARK: Properties
    var title: String
    var body: String
    let date: Date
    
    var cloudKitRecordID: CKRecordID?
    
    // MARK: Initializers
    // Designated Initializer
    init(title: String, body: String) {
        self.title = title
        self.body = body
        self.date = Date()
    }
    
    // Failable Initializer
    init?(ckRecord: CKRecord) {
        guard let title = ckRecord[Constants.titleKey] as? String,
        let body = ckRecord[Constants.bodyKey] as? String,
        let date = ckRecord[Constants.dateKey] as? Date
            else { return nil }
        
        self.title = title
        self.body = body
        self.date = date
        
        self.cloudKitRecordID = ckRecord.recordID
    }
}

// Turn the JournalEntry into a CKRecord
extension CKRecord {
    
    convenience init(journalEntry: JournalEntry) {
        
        let recordID = journalEntry.cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        self.init(recordType: Constants.journalEntryTypeKey, recordID: recordID)
        self.setValue(journalEntry.title, forKey: Constants.titleKey)
        self.setValue(journalEntry.body, forKey: Constants.bodyKey)
        self.setValue(journalEntry.date, forKey: Constants.dateKey)
        
        journalEntry.cloudKitRecordID = recordID
    }
}

extension JournalEntry: Equatable {
    static func == (lhs: JournalEntry, rhs: JournalEntry) -> Bool {
        return lhs.cloudKitRecordID == rhs.cloudKitRecordID
    }
}
