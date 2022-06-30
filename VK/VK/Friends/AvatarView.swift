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

    
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var shadowRadius: CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarShadow.layer.shadowColor = shadowColor.cgColor
        avatarShadow.layer.shadowOpacity = shadowOpacity
        avatarShadow.layer.shadowOffset = .zero
        avatarShadow.layer.shadowRadius = shadowRadius
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
