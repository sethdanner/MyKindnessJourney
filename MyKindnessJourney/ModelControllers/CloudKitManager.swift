//
//  CloudKitManager.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/14/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    
    // MARK: Porperties
    static var shared = CloudKitManager()
    let privateDB = CKContainer.default().privateCloudDatabase
    
    func save(recordsToSave: [CKRecord], completion: @escaping (Error?) -> Void) {
        
        modifyRecords(recordToSave: recordsToSave, recordsIDsToDelete: nil, completion: completion)
    }
    
    func delete(recordIDsToDelete: [CKRecordID], completion: @escaping (Error?) -> Void) {
        
        modifyRecords(recordToSave: nil, recordsIDsToDelete: recordIDsToDelete, completion: completion)
    }
    
    func modifyRecords(recordToSave: [CKRecord]?, recordsIDsToDelete: [CKRecordID]?, completion: @escaping (Error?) -> Void) {
        
        let opereration = CKModifyRecordsOperation(recordsToSave: recordToSave, recordIDsToDelete: recordsIDsToDelete)
        
        opereration.savePolicy = .changedKeys
        opereration.queuePriority = .high
        opereration.qualityOfService = .userInteractive
        opereration.perRecordProgressBlock = nil
        opereration.modifyRecordsCompletionBlock = { (_, _, error) in
            completion(error)
            
        }
        
        privateDB.add(opereration)
    }
    
    func fetchRecords(withRecordType recordType: String, predicate: NSPredicate, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        
        let query = CKQuery(recordType: recordType, predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: Constants.dateKey, ascending: false)]
        privateDB.perform(query, inZoneWith: nil, completionHandler: completion)
    }
}
