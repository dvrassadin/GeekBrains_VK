//
//  AvatarView.swift
//  VK
//
//  Created by Daniil Rassadin on 28.06.2022.
//

import UIKit

class AvatarView: UIView {

    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var avatarShadow: UIView!
    @IBOutlet var likeCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarShadow.layer.shadowColor = UIColor.black.cgColor
        avatarShadow.layer.shadowOpacity = 0.5
        avatarShadow.layer.shadowOffset = .zero
        avatarShadow.layer.shadowRadius = 5
    }
    
    override func layoutSubviews() {
        avatarShadow.layer.cornerRadius = bounds.height / 2
        avatarImage.layer.cornerRadius = bounds.height / 2
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
