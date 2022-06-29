//
//  LikeControl.swift
//  VK
//
//  Created by Daniil Rassadin on 28.06.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet var likeImage: UIImageView!
    var likeStatus: Bool = false
    
    
    override func awakeFromNib() {
        likeImage.backgroundColor = .clear
        likeImage.image = UIImage(systemName: "heart")
        likeImage.tintColor = .black
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
