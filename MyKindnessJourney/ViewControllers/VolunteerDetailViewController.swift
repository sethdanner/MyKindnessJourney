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
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var findOutMoreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        setupFindOutMoreButton()
        setupAdressLabels()
    }
    
    @IBAction func findOutMoreButton(_ sender: UIButton) {
        
        guard let url = volunteerOpportunity?.url else { return }
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }
    
    func updateViews() {
        
        titleLabel.text = volunteerOpportunity?.name
        organizationNameLabel.text = volunteerOpportunity?.organizationName
        shortDescriptionLabel.text = volunteerOpportunity?.shortDescription
        addressLabel.text = volunteerOpportunity?.address
        
        titleLabel.textColor = UIColor.black
        organizationNameLabel.textColor = UIColor.black
        shortDescriptionLabel.textColor = UIColor.black
        addressLabel.textColor = UIColor.black
    }
    
    func setupFindOutMoreButton() {
        
        findOutMoreButton.layer.borderColor = UIColor.black.cgColor
        findOutMoreButton.layer.borderWidth = 2
        findOutMoreButton.layer.cornerRadius = findOutMoreButton.frame.height / 2
        findOutMoreButton.backgroundColor = UIColor.purple
        findOutMoreButton.setTitleColor(UIColor.white, for: .normal)
        findOutMoreButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    func setupAdressLabels() {

        addressLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: findOutMoreButton.topAnchor, constant: -40).isActive = true
        addressLabel.translatesAutoresizingMaskIntoConstraints = false

    }
}
