//
//  JournalDetailViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/13/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class JournalDetailViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    var journalEntry: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text, !title.isEmpty, let body = bodyTextField.text else { return }
        
        if journalEntry == nil {
            JournalController.shared.addJournalEntry(with: title, body: body)
        } else {
            JournalController.shared.updateJournalEntry(with: journalEntry!, newTitle: title, newBody: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard let journalEntry = journalEntry else { return }
        titleTextField.text = journalEntry.title
        bodyTextField.text = journalEntry.body
    }
}
