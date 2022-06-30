//
//  FriendsViewController.swift
//  VK
//
//  Created by Daniil Rassadin on 25.06.2022.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends = [
        User(name: "Пётр", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Дарья", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Василий", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Егор", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Анастасия", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Екатерина", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Дмитрий", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Кирилл", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Лорина", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Виктория", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Ирина", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Игорь", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Павел", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Антон", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Иван", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Магомед", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Анна", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Валерия", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Мария", image: UIImage(systemName: "person.crop.rectangle")),
        User(name: "Арсений", image: UIImage(systemName: "person.crop.rectangle.fill")),
        User(name: "Прохор", image: UIImage(systemName: "person.crop.rectangle.fill"))
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
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsViewCell
        
        var content = cell.defaultContentConfiguration()
        content.text = friends[indexPath.row].name
        content.image = friends[indexPath.row].image

        cell.contentConfiguration = content
        
//        cell.friendName.text = friends[indexPath.row].name
//        cell.friendImage.image = friends[indexPath.row].image
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendName",
           let destinationVC = segue.destination as? PhotosViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedName = friends[indexPath.row].name
            destinationVC.title = selectedName
        }
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
