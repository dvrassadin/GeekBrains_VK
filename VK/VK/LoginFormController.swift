//
//  LoginFormController.swift
//  VK
//
//  Created by Daniil Rassadin on 18.06.2022.
//

import UIKit

class LoginFormController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var animationFirstDot: UIView!
    @IBOutlet weak var animationSecondDot: UIView!
    @IBOutlet weak var animationThirdDot: UIView!
    @IBAction func signInButton(_ sender: Any) {
        signInAnimation()
        if checkUserData() {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                self.stopSignInAnimation()
                self.performSegue(withIdentifier: "SignIn", sender: nil)
            }
        } else {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                self.stopSignInAnimation()
                self.showLoginError()
            }
        }
    }
      
       
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        let checkoutResult = checkUserData()
//
//        signInAnimation()
//
//        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
//            self.stopSignInAnimation()
//            if !checkoutResult {
//                self.showLoginError()
//            }
//        }
//
//        return checkoutResult
//    }
    
    func checkUserData() -> Bool {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {return false}
        
        if username == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(title: "Authorization failed", message: "Invalid username and/or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
        self.passwordTextField.text = ""
    }
    
    @IBOutlet var scrollView: UIScrollView!
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        performSegue(withIdentifier: "SignIn", sender: nil)
        
        animationFirstDot.layer.cornerRadius = animationFirstDot.bounds.height / 2
        animationSecondDot.layer.cornerRadius = animationFirstDot.bounds.height / 2
        animationThirdDot.layer.cornerRadius = animationFirstDot.bounds.height / 2
    }
    
    //MARK: - Animation
    
    private func signInAnimation () {
        animationView.backgroundColor = .systemBackground
        animationFirstDot.backgroundColor = .systemBlue
        animationFirstDot.alpha = 0
        animationSecondDot.backgroundColor = .systemBlue
        animationSecondDot.alpha = 0
        animationThirdDot.backgroundColor = .systemBlue
        animationThirdDot.alpha = 0
        
        UIView.animate(withDuration: 1.2, delay: 0, options: [.repeat, .autoreverse]) {
            self.animationFirstDot.alpha = 1
        }
        UIView.animate(withDuration: 1.2, delay: 0.25, options: [.repeat, .autoreverse]) {
            self.animationSecondDot.alpha = 1
        }
        UIView.animate(withDuration: 1.2, delay: 0.5, options: [.repeat, .autoreverse]) {
            self.animationThirdDot.alpha = 1
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
//                            self.performSegue(withIdentifier: "SignIn", sender: nil)
//        })
    }
    
    private func stopSignInAnimation() {
        animationView.backgroundColor = .clear
        animationFirstDot.backgroundColor = .clear
        animationSecondDot.backgroundColor = .clear
        animationThirdDot.backgroundColor = .clear
    }
    
}
