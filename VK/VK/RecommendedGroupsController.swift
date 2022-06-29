//
//  Recommended Groups.swift
//  VK
//
//  Created by Daniil Rassadin on 22.06.2022.
//

import UIKit

class RecommendedGroupsController: UITableViewController {

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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recommendedGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! RecommendedGroupsCell
        
        cell.groupName.text = recommendedGroups[indexPath.row].name
        cell.groupImage.image = recommendedGroups[indexPath.row].image

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
