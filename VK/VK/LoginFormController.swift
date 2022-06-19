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
    @IBAction func signInButton(_ sender: Any) {

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkoutResult = checkUserData()
        
        if !checkoutResult {
            showLoginError()
        }
        return checkoutResult
    }
    
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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
