//
//  FriendsViewCell.swift
//  VK
//
//  Created by Daniil Rassadin on 25.06.2022.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var avatarWithShadow: AvatarView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        avatarWithShadow.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: -20) {
            self.avatarWithShadow.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.avatarWithShadow.transform = .identity
        }
    }
}
