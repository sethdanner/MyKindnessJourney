//
//  JournalTableViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/13/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit
import CoreData

class JournalListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JournalController.shared.loadFromPersistentStore()
        JournalController.shared.fetchedResultsController.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return JournalController.shared.fetchedResultsController.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalEntryCell", for: indexPath)
        
        let journalEntry = JournalController.shared.fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = journalEntry.title
        let date = journalDateFormatter()
        cell.detailTextLabel?.text = date

        return cell
    }
    
    func journalDateFormatter() -> String? {
        let date = Date()
        let dateFormatterToString = DateFormatter()
        dateFormatterToString.dateFormat = "MMMM dd, YYYY"
        let dateAsString = dateFormatterToString.string(from: date)
        
        return dateAsString
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let journalEntry = JournalController.shared.fetchedResultsController.fetchedObjects?[indexPath.row] else { return }
            JournalController.shared.deleteJournalEntry(entry: journalEntry)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toJournalDetailViewController",
            let indexPath = tableView.indexPathForSelectedRow {
            guard let journalEntry = JournalController.shared.fetchedResultsController.fetchedObjects?[indexPath.row] else { return }
            let destinationVC = segue.destination as? JournalDetailViewController
            destinationVC?.journalEntry = journalEntry
        }
    }
}

extension JournalListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else { return }
            tableView.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    // Delete if only one section
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            tableView.insertSections(indexSet, with: .automatic)
        case .delete:
            tableView.deleteSections(indexSet, with: .automatic)
        default:
            return
        }
    }
}
