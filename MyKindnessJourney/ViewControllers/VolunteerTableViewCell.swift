//
//  VolunteerTableViewCell.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/11/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class VolunteerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var volunteerTitleLabel: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    private func updateViews() {
        
        guard let volunteerOpportunity = volunteerOpportunity else { return }
        self.organizationNameLabel.text = volunteerOpportunity.organizationName
        self.volunteerTitleLabel.text = volunteerOpportunity.volunteerTitle
        self.streetAddress.text = volunteerOpportunity.streetAddress
        self.cityLabel.text = volunteerOpportunity.city
        self.stateLabel.text = volunteerOpportunity.state
        self.zipLabel.text = volunteerOpportunity.zip
        self.descriptionLabel.text = volunteerOpportunity.description
        self.linkLabel.text = volunteerOpportunity.link
        self.categoryLabel.text = volunteerOpportunity.category
    }
    
    var volunteerOpportunity: Volunteer? {
        didSet {
            updateViews()
        }
    }
}
