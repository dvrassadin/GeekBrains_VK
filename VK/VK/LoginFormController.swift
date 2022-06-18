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
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if username == "" && password == "" {
            print("Succesful authorization")
        } else {
            print("Authorization failed")
        }
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
