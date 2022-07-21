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
    
    enum AnimationDirection {
        case left, right, down
    }
    var animationDeriction: AnimationDirection = .left
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else {return}
        
        bigPhoto.image = photos[index.item] ?? UIImage(systemName: "questionmark.square.dashed")
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewPanned))

        view.addGestureRecognizer(panGestureRecognizer)
    }
        
    
    // MARK: Interactive
    
    @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {

        switch recognizer.state {
        case .began:
            if recognizer.translation(in: view).x > 0 {
                guard self.index.item >= 1 else {return}
                
                animationDeriction = .right
                
                self.additionalBigPhoto.image = self.photos[self.index.item - 1]
                self.additionalBigPhoto.transform = CGAffineTransform(translationX: -self.additionalBigPhoto.bounds.width - 120, y: 0)
                
                propertyAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
                    self.bigPhoto.transform = CGAffineTransform(translationX: self.bigPhoto.bounds.width + 120, y: 0)
                    self.additionalBigPhoto.transform = .identity
                })
                propertyAnimator.addCompletion { position in
                    switch position {
                    case .end:
                        self.index.item -= 1
                        self.bigPhoto.image = self.photos[self.index.item]
                        self.bigPhoto.transform = .identity
//                        self.additionalBigPhoto.image = nil
                    case .start:
                        self.additionalBigPhoto.transform = CGAffineTransform(translationX: -self.additionalBigPhoto.bounds.width, y: 0)
                    case .current:
                        break
                    @unknown default:
                        break
                    }
                }
            } else if recognizer.translation(in: view).x < 0 {
                guard self.index.item < photos.count - 1 else {return}
                
                animationDeriction = .left
                
                self.additionalBigPhoto.image = self.photos[self.index.item + 1]
                self.additionalBigPhoto.transform = CGAffineTransform(translationX: self.additionalBigPhoto.bounds.width, y: 0)
                
                propertyAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
                    self.bigPhoto.transform = CGAffineTransform(translationX: -self.bigPhoto.bounds.width - 120, y: 0)
                    self.additionalBigPhoto.transform = .identity
                })
                propertyAnimator.addCompletion { position in
                    switch position {
                    case .end:
                        self.index.item += 1
                        self.bigPhoto.image = self.photos[self.index.item]
                        self.bigPhoto.transform = .identity
                        self.additionalBigPhoto.image = nil
                    case .start:
                        self.additionalBigPhoto.transform = CGAffineTransform(translationX: self.additionalBigPhoto.bounds.width - 120, y: 0)
                    case .current:
                        break
                    @unknown default:
                        break
                    }
                }
            } else if recognizer.translation(in: view).y > 0 {
                animationDeriction = .down
                
                propertyAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
                    self.bigPhoto.transform = CGAffineTransform(translationX: 0, y: self.bigPhoto.bounds.height)
                })
                propertyAnimator.addCompletion { position in
                    switch position {
                    case .end:
                        let photosViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
                        photosViewController.transitioningDelegate = photosViewController
                        self.navigationController?.pushViewController(photosViewController, animated: true)
                                                
                        self.bigPhoto.transform = .identity
                        self.additionalBigPhoto.image = nil
                    case .start:
                        self.additionalBigPhoto.transform = CGAffineTransform(translationX: 0, y: self.additionalBigPhoto.bounds.height)
                    case .current:
                        break
                    @unknown default:
                        break
                    }
                }
            } else {
                break
            }
        case .changed:
            switch animationDeriction {
            case .left:
                let percent = min(max(0, -recognizer.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = percent
            case .right:
                let percent = min(max(0, recognizer.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = percent
            case .down:
                let percent = min(max(0, recognizer.translation(in: view).y / 200), 1)
                propertyAnimator.fractionComplete = percent
            }
        case .ended:
            if propertyAnimator.fractionComplete > 0.4 {
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            } else {
                propertyAnimator.isReversed = true
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            }
//            bigPhoto.transform = .identity
        default:
            break
        }
    }
}

// MARK: without down swipe

//@objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
//
//    switch recognizer.state {
//    case .began:
//        if recognizer.translation(in: view).x > 0 {
//            guard self.index.item >= 1 else {return}
//
//            animationDeriction = .right
//
//            self.additionalBigPhoto.image = self.photos[self.index.item - 1]
//            self.additionalBigPhoto.transform = CGAffineTransform(translationX: -self.additionalBigPhoto.bounds.width - 120, y: 0)
//
//            propertyAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
//                self.bigPhoto.transform = CGAffineTransform(translationX: self.bigPhoto.bounds.width + 120, y: 0)
//                self.additionalBigPhoto.transform = .identity
//            })
//            propertyAnimator.addCompletion { position in
//                switch position {
//                case .end:
//                    self.index.item -= 1
//                    self.bigPhoto.image = self.photos[self.index.item]
//                    self.bigPhoto.transform = .identity
////                        self.additionalBigPhoto.image = nil
//                case .start:
//                    self.additionalBigPhoto.transform = CGAffineTransform(translationX: -self.additionalBigPhoto.bounds.width, y: 0)
//                case .current:
//                    break
//                @unknown default:
//                    break
//                }
//            }
//        } else {
//            guard self.index.item < photos.count - 1 else {return}
//
//            animationDeriction = .left
//
//            self.additionalBigPhoto.image = self.photos[self.index.item + 1]
//            self.additionalBigPhoto.transform = CGAffineTransform(translationX: self.additionalBigPhoto.bounds.width, y: 0)
//
//            propertyAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
//                self.bigPhoto.transform = CGAffineTransform(translationX: -self.bigPhoto.bounds.width - 120, y: 0)
//                self.additionalBigPhoto.transform = .identity
//            })
//            propertyAnimator.addCompletion { position in
//                switch position {
//                case .end:
//                    self.index.item += 1
//                    self.bigPhoto.image = self.photos[self.index.item]
//                    self.bigPhoto.transform = .identity
////                        self.additionalBigPhoto.image = nil
//                case .start:
//                    self.additionalBigPhoto.transform = CGAffineTransform(translationX: self.additionalBigPhoto.bounds.width - 120, y: 0)
//                case .current:
//                    break
//                @unknown default:
//                    break
//                }
//            }
//        }
//    case .changed:
//        switch animationDeriction {
//        case .left:
//            let percent = min(max(0, -recognizer.translation(in: view).x / 200), 1)
//            propertyAnimator.fractionComplete = percent
//        case .right:
//            let percent = min(max(0, recognizer.translation(in: view).x / 200), 1)
//            propertyAnimator.fractionComplete = percent
//        }
//    case .ended:
//        if propertyAnimator.fractionComplete > 0.4 {
//            propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
//        } else {
//            propertyAnimator.isReversed = true
//            propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
//        }
////            bigPhoto.transform = .identity
//    default:
//        break
//    }
//}

// MARK: without interactive

//    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
//
//        guard index.item >= 1 else {return}
//
//        additionalBigPhoto.transform = CGAffineTransform(translationX: -additionalBigPhoto.bounds.width - 120, y: 0).concatenating(CGAffineTransform(scaleX: 1.4, y: 1.4))
//        additionalBigPhoto.image = photos[index.item - 1]
//
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
//            self.bigPhoto.transform = CGAffineTransform(translationX: self.bigPhoto.bounds.width + 120, y: 0).concatenating(CGAffineTransform(scaleX: 0.7, y: 0.7))
//            self.additionalBigPhoto.transform = .identity
//
//        } completion: { _ in
//            self.index.item -= 1
//            self.bigPhoto.image = self.photos[self.index.item]
//            self.bigPhoto.transform = .identity
//        }
//    }
//
//    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
//
//        guard index.item < photos.count - 1 else {return}
//
//        additionalBigPhoto.transform = CGAffineTransform(translationX: additionalBigPhoto.bounds.width + 120, y: 0).concatenating(CGAffineTransform(scaleX: 1.4, y: 1.4))
//        additionalBigPhoto.image = photos[index.item + 1]
//
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
//            self.bigPhoto.transform = CGAffineTransform(translationX: -self.bigPhoto.bounds.width - 120, y: 0).concatenating(CGAffineTransform(scaleX: 0.7, y: 0.7))
//            self.additionalBigPhoto.transform = .identity
//
//        } completion: { _ in
//            self.index.item += 1
//            self.bigPhoto.image = self.photos[self.index.item]
//            self.bigPhoto.transform = .identity
//        }
//    }
