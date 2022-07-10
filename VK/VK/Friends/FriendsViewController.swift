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
        User(name: "Яков", surname: "Отвсяков", image: UIImage(named: "maleAvatar")),
        User(name: "Кристина", surname: "Чернова", image: UIImage(named: "femaleAvatar"))
    ]

    var sortedFriends = [Character: [User]]()
    
    private func sort(friends: [User]) -> [Character: [User]] {
        var friendsForSort = [Character: [User]]()
        
        friends.forEach() {friend in
            guard let firstChar = friend.name.first else {return}
            
            if var thisCharUser = friendsForSort[firstChar] {
                thisCharUser.append(friend)
                friendsForSort[firstChar] = thisCharUser
            } else {
                friendsForSort[firstChar] = [friend]
            }
        }
        
        return friendsForSort
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.sortedFriends = sort(friends: friends)

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortredKeys = sortedFriends.keys.sorted()
        let friends = sortedFriends[sortredKeys[section]]?.count ?? 0
        
        return friends
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsViewCell
        
        let fisrtChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[fisrtChar]!
        let friend: User = friends[indexPath.row]
        
        cell.friendName.text = friend.name + " " + (friend.surname ?? "")
        cell.avatarWithShadow.avatarImage.image = friend.image ?? UIImage(named: "noPhotoDog")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.layer.opacity = 0.5
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendName",
           let destinationVC = segue.destination as? PhotosViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedName = friends[indexPath.row].name + " " + (friends[indexPath.row].surname ?? "")
            destinationVC.title = selectedName
        }
    }
    
    
    
}
