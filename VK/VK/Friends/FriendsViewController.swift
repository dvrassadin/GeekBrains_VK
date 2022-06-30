//
//  FriendsViewController.swift
//  VK
//
//  Created by Daniil Rassadin on 25.06.2022.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends = [
        User(name: "Пётр", surname: "Иванов", image: UIImage(named: "maleAvatar")),
        User(name: "Дарья", surname: nil, image: UIImage(named: "femaleAvatar")),
        User(name: "Василий", surname: "Петров", image: UIImage(named: "maleAvatar")),
        User(name: "Егор", surname: "Елисеев", image: UIImage(named: "maleAvatar")),
        User(name: "Анастасия", surname: "Чернова", image: UIImage(named: "femaleAvatar")),
        User(name: "Екатерина", surname: "Фёдорова", image: UIImage(named: "femaleAvatar")),
        User(name: "Дмитрий", surname: "Базыкин", image: nil),
        User(name: "Кирилл", surname: "Криулин", image: UIImage(named: "maleAvatar")),
        User(name: "Лорина", surname: nil, image: UIImage(named: "femaleAvatar")),
        User(name: "Виктория", surname: "Иванцова", image: nil),
        User(name: "Ирина", surname: "Григорова", image: UIImage(named: "femaleAvatar")),
        User(name: "Игорь", surname: "Галушко", image: UIImage(named: "maleAvatar")),
        User(name: "Павел", surname: "Тур", image: UIImage(named: "maleAvatar")),
        User(name: "Антон", surname: "Аринин", image: nil),
        User(name: "Иван", surname: "Нооль", image: UIImage(named: "maleAvatar")),
        User(name: "Магомед", surname: "Магомедов", image: UIImage(named: "maleAvatar")),
        User(name: "Анна", surname: "Данилейко", image: UIImage(named: "femaleAvatar")),
        User(name: "Валерия", surname: "Чернова", image: UIImage(named: "femaleAvatar")),
        User(name: "Мария", surname: "Панова", image: UIImage(named: "femaleAvatar")),
        User(name: "Арсений", surname: nil, image: UIImage(named: "maleAvatar")),
        User(name: "Прохор", surname: nil, image: UIImage(named: "maleAvatar")),
        User(name: "Руслан", surname: nil, image: nil),
        User(name: "Яков", surname: "Отвсяков", image: UIImage(named: "maleAvatar"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        friends.sort {$0.name < $1.name}

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
        
        cell.friendName.text = friends[indexPath.row].name + " " + (friends[indexPath.row].surname ?? "")
        cell.avatarWithShadow.avatarImage.image = friends[indexPath.row].image ?? UIImage(named: "noPhotoDog")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendName",
           let destinationVC = segue.destination as? PhotosViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedName = friends[indexPath.row].name + " " + (friends[indexPath.row].surname ?? "")
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
