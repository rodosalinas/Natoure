//
//  SignUpVC.swift
//  playaround
//
//  Created by Marco Martínez on 09/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import FBSDKLoginKit
import UIKit

class SignUpVC: UIViewController,  UITextFieldDelegate, FBSDKLoginButtonDelegate{
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var facebookBtn: FBSDKLoginButton!
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userLastNameField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    var parentVC:SignUserVC? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookBtn.readPermissions = ["public_profile", "email"]
        facebookBtn.delegate = self
        
        userNameField.delegate = self
        userLastNameField.delegate = self
        userEmailField.delegate = self
        userPasswordField.delegate = self
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    @IBAction func openTerms(_ sender: Any) {
        UIApplication.shared.open(URL(string : "http://www.stackoverflow.com")!, options: [:], completionHandler: nil)
    }
    @IBAction func openPrivacy(_ sender: Any) {
        UIApplication.shared.open(URL(string : "http://www.stackoverflow.com")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func scrollViewOnBeginEditing(_ sender: Any) {
        //scrollView.
        let point = CGPoint(x: 0, y: 250)
        scrollView.scrollTo(direction: point, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameField:
            userNameField.resignFirstResponder()
            userLastNameField.becomeFirstResponder()
        case userLastNameField:
            userLastNameField.resignFirstResponder()
            userEmailField.becomeFirstResponder()
        case userEmailField:
            userEmailField.resignFirstResponder()
            userPasswordField.becomeFirstResponder()
        case userPasswordField:
             signUpUser()
        default:
            break
        }
        return true
    }
    
    @IBAction func registerNewUser(_ sender: Any) {
        print("Register user")
        // signUpUser()
    }
    
    func signUpUser(){
        let point = CGPoint(x: 0, y: 0)
        scrollView.scrollTo(direction: point, animated: true)
        view.endEditing(true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func showLoginScreen(_ sender: Any) {
        if parentVC != nil{
            parentVC?.showLoginScreen()
        }
    }
}
