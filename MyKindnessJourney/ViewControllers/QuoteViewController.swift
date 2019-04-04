//
//  QuoteOfTheDayViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/6/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        setupQuoteText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.enableAllOrientation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.enableAllOrientation = false
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func updateView() {
        
        quoteController.fetchQuote { (quote) in

            self.quoteController.fetchQuote(completion: { (quote) in
                DispatchQueue.main.async {
                    self.quoteLabel.text = quote?.quote
                    self.authorLabel.text = quote?.author
                    self.copyrightLabel.text = quote?.copyright
                }
            })
        }
    }
    
    func setupQuoteText() {
        
        quoteLabel.font = UIFont(name: "Baskerville", size: 22)
        authorLabel.font = UIFont(name: "Baskerville", size: 22)
    }
    
    private let quoteController = QuoteController()
}
