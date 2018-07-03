//
//  JournalDetailViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/13/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class JournalDetailViewController: UIViewController, UITextViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var journalEntry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    // MARK: Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text, !title.isEmpty, let body = bodyTextField.text else { return }
        
        if let journalEntry = journalEntry {
            JournalEntryController.shared.updateJournalEntry(journalEntry: journalEntry, title: title, body: body) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
                if !success {
//                    DispatchQueue.main.async {
//                        let alertController = UIAlertController(title: "Unable to Save", message: "Please login into iCloud in iPhone settings", preferredStyle: .alert)
//                        alertController.present(alertController, animated: true, completion: nil)
//
//                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
//                            self.dismiss(animated: true, completion: nil)
//                        })
//                        alertController.addAction(cancelAction)
//                    }
                }
            }
            
        } else {
            JournalEntryController.shared.createNewJournalEntry(with: title, body: body) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
                if !success {
                    if !success {
//                        DispatchQueue.main.async {
//                            let alertController = UIAlertController(title: "Unable to Save", message: "Please login into iCloud in iPhone settings", preferredStyle: .alert)
//                            alertController.present(alertController, animated: true, completion: nil)
//
//                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
//                                self.dismiss(animated: true, completion: nil)
//                            })
//                            alertController.addAction(cancelAction)
//                        }
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    func updateViews() {
        guard let journalEntry = journalEntry else { return }
        titleTextField.text = journalEntry.title
        bodyTextField.text = journalEntry.body
    }
}
