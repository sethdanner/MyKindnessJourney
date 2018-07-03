//
//  JournalEntryTableViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/14/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class JournalEntryListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var journalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JournalEntryController.shared.journalEntries.removeAll()
        
        journalTableView.delegate = self
        journalTableView.dataSource = self
        
        JournalEntryController.shared.fetchAllJournalEntries { (success) in
            if success {
                DispatchQueue.main.async {
                    self.journalTableView.reloadData()
                }
            }
            if !success {
                // Present Alert Controller with Error Message
            }
        }
        // query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        journalTableView.reloadData()
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return JournalEntryController.shared.journalEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalEntryCell", for: indexPath)
        
        let journalEntry = JournalEntryController.shared.journalEntries[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        cell.textLabel?.text = journalEntry.title
        cell.detailTextLabel?.text = dateFormatter.string(from: journalEntry.date)
        
        return cell
    }

    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let journalEntry = JournalEntryController.shared.journalEntries[indexPath.row]
            JournalEntryController.shared.deleteJournalEntry(journalEntry: journalEntry) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.journalTableView.deleteRows(at: [indexPath], with: .fade)
                    }
                }
                
                if !success {
                    // Present alert controller
                }
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toJournalDetailViewController" {
            guard let journalDetailVC = segue.destination as? JournalDetailViewController,
            let indexPath = journalTableView.indexPathForSelectedRow
                else { return }
            
            let journalEntry = JournalEntryController.shared.journalEntries[indexPath.row]
            journalDetailVC.journalEntry = journalEntry
        }
    }
}
