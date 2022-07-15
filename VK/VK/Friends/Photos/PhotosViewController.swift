//
//  PhotosViewController.swift
//  VK
//
//  Created by Daniil Rassadin on 25.06.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosViewController: UICollectionViewController {
    
    let photos = [UIImage(named: "photo1"), UIImage(named: "photo2"), UIImage(named: "photo3"), UIImage(named: "photo4"), UIImage(named: "photo5"), UIImage(named: "photo6"), UIImage(named: "photo7"), UIImage(named: "photo8"), UIImage(named: "photo9"), UIImage(named: "photo10"), UIImage(named: "photo11"), UIImage(named: "photo12"), UIImage(named: "photo13"), UIImage(named: "photo14"), UIImage(named: "photo15"), UIImage(named: "photo16"), UIImage(named: "photo17"), UIImage(named: "photo18"), UIImage(named: "photo19"), UIImage(named: "photo20"), UIImage(named: "photo21"), UIImage(named: "photo22"), UIImage(named: "photo23"), UIImage(named: "photo24"), UIImage(named: "photo25"), UIImage(named: "photo26"), UIImage(named: "photo27"), UIImage(named: "photo28"), UIImage(named: "photo29"), UIImage(named: "photo30"), UIImage(named: "photo31")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bigPhoto",
           
           let destinationVC = segue.destination as? BigPhotoViewController,
           let indexPath = collectionView.indexPathsForSelectedItems?.first {
            destinationVC.index = indexPath
            destinationVC.photos = photos
        }
    }
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosViewCell
    
        cell.photo.image = photos[indexPath.item]
    
        return cell
    }
}
