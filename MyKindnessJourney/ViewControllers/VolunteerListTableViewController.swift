//
//  VolunteerListTableViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/11/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class VolunteerListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var volunteerSearchBar: UISearchBar!
    @IBOutlet weak var volunteerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volunteerTableView.delegate = self
        volunteerTableView.dataSource = self
        volunteerSearchBar.delegate = self
        volunteerSearchBar.showsCancelButton = false
        volunteerSearchBar.placeholder = "enter city, state, or zip code"
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        VolunteerController.shared.fetchVolunteerOpportunities { (success) in
            
            if success {
                DispatchQueue.main.async {
                    self.volunteerTableView.reloadData()
                }
            }
            
            if success != true {
                DispatchQueue.main.async {
                    // present alert controller
                }
            }
        }
        
        volunteerSearchBar.endEditing(true )
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        volunteerSearchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        volunteerSearchBar.endEditing(true)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return VolunteerController.shared.volunteerOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "volunteerCell", for: indexPath)
        let volunteerOpportunity = VolunteerController.shared.volunteerOpportunities[indexPath.row]
        cell.textLabel?.text = volunteerOpportunity.name
        cell.detailTextLabel?.text = volunteerOpportunity.organizationName
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVolunteerDetailVC" {
            guard let destinationVC = segue.destination as? VolunteerDetailViewController,
                let indexPath = volunteerTableView.indexPathForSelectedRow else { return }
            let volunteerOpportunity = VolunteerController.shared.volunteerOpportunities[indexPath.row]
            destinationVC.volunteerOpportunity = volunteerOpportunity
        }
    }
}
