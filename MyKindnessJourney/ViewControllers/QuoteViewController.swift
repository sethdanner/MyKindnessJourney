//
//  QuoteOfTheDayViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/6/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {

        quoteController.fetchQuote { (quote) in

            guard let quote = quote else { return }

            self.quoteController.fetchBackgroundImage(with: quote, completion: { (image) in
                DispatchQueue.main.async {

                    self.backgroundImageView.image = image
                    self.quoteLabel.text = quote.quote
                    self.authorLabel.text = quote.author
                    self.copyrightLabel.text = quote.copyright
                }
            })
      }
    }
    
    private let quoteController = QuoteController()
}
