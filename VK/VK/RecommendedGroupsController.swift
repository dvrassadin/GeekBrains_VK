//
//  Recommended Groups.swift
//  VK
//
//  Created by Daniil Rassadin on 22.06.2022.
//

import UIKit

class RecommendedGroupsController: UITableViewController, UISearchBarDelegate {

    var recommendedGroups = [
        Group(name: "Котики", image: UIImage(systemName: "pawprint")),
        Group(name: "Собачки", image: UIImage(systemName: "pawprint")),
        Group(name: "Путешествия", image: UIImage(systemName: "airplane")),
        Group(name: "iOS Dev", image: UIImage(systemName: "swift")),
        Group(name: "Байкал", image: UIImage(systemName: "humidity")),
        Group(name: "Типичный Питер", image: UIImage(systemName: "umbrella")),
        Group(name: "Корейская кухня", image: UIImage(systemName: "fork.knife")),
        Group(name: "Китайская кухня", image: UIImage(systemName: "fork.knife")),
        Group(name: "Apple", image: UIImage(systemName: "applelogo")),
        Group(name: "Тинькофф", image: UIImage(systemName: "dollarsign.circle")),
        Group(name: "BBC", image: UIImage(systemName: "note.text")),
        Group(name: "DW Главное", image: UIImage(systemName: "note.text")),
        Group(name: "Varlamov News", image: UIImage(systemName: "note.text")),
        Group(name: "The Swift Developers", image: UIImage(systemName: "swift")),
        Group(name: "Медиазона", image: UIImage(systemName: "note.text")),
        Group(name: "The Village", image: UIImage(systemName: "note.text")),
        Group(name: "TripToDream", image: UIImage(systemName: "airplane.circle")),
        Group(name: "Furydrops", image: UIImage(systemName: "dollarsign.circle")),
        Group(name: "Петроградка", image: UIImage(systemName: "building.columns")),
        Group(name: "Красный дракон", image: UIImage(systemName: "fork.knife")),
        Group(name: "Пянсе", image: UIImage(systemName: "fork.knife"))
    ]
    
    var filterredRecommendedGroups: [Group]!
    
    @IBOutlet weak var searchBar: UISearchBar!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filterredRecommendedGroups = recommendedGroups
        filterredRecommendedGroups.sort {$0.name < $1.name}
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterredRecommendedGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! RecommendedGroupsCell
        
        cell.groupName.text = filterredRecommendedGroups[indexPath.row].name
        cell.groupImage.image = filterredRecommendedGroups[indexPath.row].image

        return cell
    }
    
    //MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterredRecommendedGroups = []
        
        if searchText == "" {
            filterredRecommendedGroups = recommendedGroups
            
        } else {
            for group in recommendedGroups {
                if group.name.lowercased().contains(searchText.lowercased()) {
                    filterredRecommendedGroups.append(group)
                }
            }
        }
        self.tableView.reloadData()
    }
}
