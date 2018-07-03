//
//  VolunteerDetailViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/19/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class VolunteerDetailViewController: UIViewController {
    
    // MARK: Properties
    var volunteerOpportunity: Volunteer?
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var findOutMoreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        setupFindOutMoreButton()
        setupDateLocationLabels()
    }
    
    @IBAction func findOutMoreButton(_ sender: UIButton) {
        
        guard let url = volunteerOpportunity?.url else { return }
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }
    
    func updateViews() {
        
        titleLabel.text = volunteerOpportunity?.name
        organizationNameLabel.text = volunteerOpportunity?.organizationName
        shortDescriptionLabel.text = volunteerOpportunity?.shortDescription
        dateLabel.text = volunteerOpportunity?.date
        cityLabel.text = volunteerOpportunity?.city
        stateLabel.text = volunteerOpportunity?.state
        zipLabel.text = volunteerOpportunity?.zip
        
        titleLabel.textColor = UIColor.black
        organizationNameLabel.textColor = UIColor.black
        shortDescriptionLabel.textColor = UIColor.black
        dateLabel.textColor = UIColor.black
        cityLabel.textColor = UIColor.black
        stateLabel.textColor = UIColor.black
        zipLabel.textColor = UIColor.black
        
    }
    
    func setupFindOutMoreButton() {
        
        findOutMoreButton.layer.borderColor = UIColor.black.cgColor
        findOutMoreButton.layer.borderWidth = 2
        findOutMoreButton.layer.cornerRadius = findOutMoreButton.frame.height / 2
        findOutMoreButton.backgroundColor = UIColor.purple
        findOutMoreButton.setTitleColor(UIColor.white, for: .normal)
        findOutMoreButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    func setupDateLocationLabels() {
        
        dateTitleLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        
        dateLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 8).isActive = true
        
        cityLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        
        
    }
}
