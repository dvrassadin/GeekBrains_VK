//
//  BigPhotoViewController.swift
//  VK
//
//  Created by Daniil Rassadin on 11.07.2022.
//

import UIKit

class BigPhotoViewController: UIViewController {
    
    @IBOutlet weak var bigPhoto: UIImageView! {
        didSet {
            bigPhoto.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var additionalBigPhoto: UIImageView!
    
    
    var photos = [UIImage?]()
    var index:IndexPath = []
    var propertyAnimator = UIViewPropertyAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else {return}
        
        bigPhoto.image = photos[index.item] ?? UIImage(systemName: "questionmark.square.dashed")
        
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewPanned))
//
//        view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        
        guard index.item >= 1 else {return}

        additionalBigPhoto.transform = CGAffineTransform(translationX: -additionalBigPhoto.bounds.width - 120, y: 0).concatenating(CGAffineTransform(scaleX: 1.4, y: 1.4))
        additionalBigPhoto.image = photos[index.item - 1]
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.bigPhoto.transform = CGAffineTransform(translationX: self.bigPhoto.bounds.width + 120, y: 0).concatenating(CGAffineTransform(scaleX: 0.7, y: 0.7))
            self.additionalBigPhoto.transform = .identity
            
        } completion: { _ in
            self.index.item -= 1
            self.bigPhoto.image = self.photos[self.index.item]
            self.bigPhoto.transform = .identity
        }
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        
        guard index.item < photos.count - 1 else {return}
        
        additionalBigPhoto.transform = CGAffineTransform(translationX: additionalBigPhoto.bounds.width + 120, y: 0).concatenating(CGAffineTransform(scaleX: 1.4, y: 1.4))
        additionalBigPhoto.image = photos[index.item + 1]
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.bigPhoto.transform = CGAffineTransform(translationX: -self.bigPhoto.bounds.width - 120, y: 0).concatenating(CGAffineTransform(scaleX: 0.7, y: 0.7))
            self.additionalBigPhoto.transform = .identity
            
        } completion: { _ in
            self.index.item += 1
            self.bigPhoto.image = self.photos[self.index.item]
            self.bigPhoto.transform = .identity
        }
    }
    
    
//    @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
//
//        switch recognizer.state {
//        case .changed:
//            bigPhoto.transform = CGAffineTransform(translationX: recognizer.translation(in: view).x, y: recognizer.translation(in: view).y)
//        case .ended:
//            bigPhoto.transform = .identity
//        default:
//            break
//        }
        
//        print(recognizer.state.rawValue)
//        print(recognizer.translation(in: view))
        
//    }
  
    
}
