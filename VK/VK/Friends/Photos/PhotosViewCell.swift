//
//  PhotosViewCell.swift
//  VK
//
//  Created by Daniil Rassadin on 25.06.2022.
//

import UIKit

class PhotosViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var conteiner: UIView!
        
    override func awakeFromNib() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        doubleTap.numberOfTapsRequired = 2
        conteiner.addGestureRecognizer(doubleTap)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        likeControl.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        likeControl.likeStatus.toggle()
        
        if likeControl.likeStatus {
            likeControl.likeImage.image = UIImage(systemName: "heart.fill")
            likeControl.likeImage.tintColor = .red
        } else {
            likeControl.likeImage.image = UIImage(systemName: "heart")
            likeControl.likeImage.tintColor = .black
        }        
    }
}
