//
//  VolunteerListTableViewController.swift
//  MyKindnessJourney
//
//  Created by Seth Danner on 6/11/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class VolunteerListTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var volunteerSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volunteerSearchBar.delegate = self
        volunteerSearchBar.showsCancelButton = true
        volunteerSearchBar.placeholder = "Enter search criteria here..."
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        volunteerController.fetchVolunteerOpportunities { (success) in
            
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            if success != true {
                DispatchQueue.main.async {
                    // present alert controller
                }
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return volunteerController.volunteerOpportunities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "volunteerCell", for: indexPath) as! VolunteerTableViewCell
        
        let volunteerOpportunity = volunteerController.volunteerOpportunities[indexPath.row]
        
        cell.volunteerOpportunity = volunteerOpportunity
        
        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private let volunteerController = VolunteerController()
    
}
