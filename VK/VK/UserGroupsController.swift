//
//  UserGroupsController.swift
//  VK
//
//  Created by Daniil Rassadin on 23.06.2022.
//

import UIKit

class UserGroupsController: UITableViewController, UISearchBarDelegate {
    
    var userGroups = [
        Group(name: "Китайская кухня", image: UIImage(systemName: "fork.knife")),
    ]
    var filteredUserGroups:[Group]!
    
    @IBOutlet weak var searchBar: UISearchBar!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredUserGroups = userGroups

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return filteredUserGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupCell", for: indexPath) as! UserGroupsCell
        
        cell.userGroupName.text = filteredUserGroups[indexPath.row].name
        cell.userGroupImage.image = filteredUserGroups[indexPath.row].image

        return cell
    }

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let recommendedGroupsController = segue.source as? RecommendedGroupsController else {return}
            
            if let indexPath = recommendedGroupsController.tableView.indexPathForSelectedRow {
                let group = recommendedGroupsController.filterredRecommendedGroups[indexPath.row]
                if !userGroups.contains(where: {$0.name == group.name}) {
                userGroups.append(group)
                filteredUserGroups = userGroups
                tableView.reloadData()
                }
            }
        }
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            filteredUserGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }
    
    //MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUserGroups = []
        
        if searchText == "" {
            filteredUserGroups = userGroups
            
        } else {
            for group in userGroups {
                if group.name.lowercased().contains(searchText.lowercased()) {
                    filteredUserGroups.append(group)
                }
            }
        }
        self.tableView.reloadData()
    }
}
