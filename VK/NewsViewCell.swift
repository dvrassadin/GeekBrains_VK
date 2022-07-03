//
//  NewsViewCell.swift
//  VK
//
//  Created by Daniil Rassadin on 03.07.2022.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    
    @IBOutlet weak var newsText: UITextView!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
