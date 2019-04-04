////
////  VolunteerTableViewController.swift
////  MyKindnessJourney
////
////  Created by Seth Danner on 6/11/18.
////  Copyright © 2018 Seth Danner. All rights reserved.
////
//
//import UIKit
//import Firebase
//
//
//
//
//
//
//
//
//
//class AddVolunteerViewController: UIViewController {
//    
//    // Outlets
//    @IBOutlet weak var organizationName: UITextField!
//    @IBOutlet weak var volTitle: UITextField!
//    @IBOutlet weak var streetAddress: UITextField!
//    @IBOutlet weak var city: UITextField!
//    @IBOutlet weak var state: UITextField!
//    @IBOutlet weak var zip: UITextField!
//    @IBOutlet weak var volDescription: UITextField!
//    @IBOutlet weak var link: UITextField!
//    @IBOutlet weak var phoneTextField: UITextField!
//    @IBOutlet weak var category: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        var ref: DatabaseReference!
//        
//        ref = Database.database().reference()
//    }
//    
//    // Action
//    @IBAction func uploadDataButtion(_ sender: UIButton) {
//        
//        guard let organizationName = organizationName.text, let title = volTitle.text, let streetAddress = streetAddress.text, let city = city.text, let state = state.text, let zip = zip.text, let volDescription = volDescription.text, let link = link.text, let phone = phoneTextField.text, let category = category.text else { return }
//        
//        volunteerController.postVolunteerOpportunity(organizationName: organizationName, volunteerTitle: title, streetAddress: streetAddress, city: city, state: state, zip: zip, link: link, phone: phone, description: volDescription, category: category, date: "", id: "") { (success) in
//            
//            if success {
//                DispatchQueue.main.async {
//                    self.organizationName.text = ""
//                    self.volTitle.text = ""
//                    self.streetAddress.text = ""
//                    self.city.text = ""
//                    self.state.text = ""
//                    self.zip.text = ""
//                    self.volDescription.text = ""
//                    self.link.text = ""
//                    self.phoneTextField.text = ""
//                    self.category.text = ""
//                }
//            }
//            
//            if success != true {
//                DispatchQueue.main.async {
//                    // present alert controller
//                }
//            }
//        }
//    }
//    
//    private let volunteerController = VolunteerController()
//}
