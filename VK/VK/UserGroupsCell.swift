//
//  UserGroupsCell.swift
//  VK
//
//  Created by Daniil Rassadin on 23.06.2022.
//

import UIKit

class UserGroupsCell: UITableViewCell {

    @IBOutlet weak var userGroupName: UILabel!
    @IBOutlet weak var userGroupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
