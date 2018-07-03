//
//  ViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/4/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var quoteOfTheDayButton: UIButton!
    @IBOutlet weak var volunteerOpportunitiesButton: UIButton!
    @IBOutlet weak var myJournalButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designWelcomeLabel()
        designQuoteButton()
        designVolunteerButton()
        designJournalButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func designWelcomeLabel() {
        
        welcomeLabel.text = Constants.welcomeLabel
        welcomeLabel.textColor = UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 1)
        welcomeLabel.font = UIFont(name: "Chalkduster", size: 55)
    }
    
    func designQuoteButton() {
        
        quoteOfTheDayButton.setTitle(Constants.quotOfTheDay, for: .normal)
        quoteOfTheDayButton.setTitleColor(UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        quoteOfTheDayButton.layer.borderColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        quoteOfTheDayButton.layer.borderWidth = 2
        quoteOfTheDayButton.layer.cornerRadius = quoteOfTheDayButton.frame.height / 2
        quoteOfTheDayButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func designVolunteerButton() {
        
        volunteerOpportunitiesButton.setTitle(Constants.volunteer, for: .normal)
        volunteerOpportunitiesButton.setTitleColor(UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        volunteerOpportunitiesButton.layer.borderColor = UIColor.white.cgColor
        volunteerOpportunitiesButton.layer.borderWidth = 2
        volunteerOpportunitiesButton.layer.cornerRadius = volunteerOpportunitiesButton.frame.height / 2
        volunteerOpportunitiesButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func designJournalButton() {
        
        myJournalButton.setTitle(Constants.myJournal, for: .normal)
        myJournalButton.setTitleColor(UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        myJournalButton.layer.borderColor = UIColor.white.cgColor
        myJournalButton.layer.borderWidth = 2
        myJournalButton.layer.cornerRadius = volunteerOpportunitiesButton.frame.height / 2
        myJournalButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
}
