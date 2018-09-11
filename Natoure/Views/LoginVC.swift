//
//  LoginVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 02/07/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Alamofire
import FBSDKLoginKit
import SwiftyJSON
import UIKit

class LoginVC: UIViewController, FBSDKLoginButtonDelegate{
    
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginWithEmail(_ sender: Any) {
        
    }
    
    var parentVC:SignUserVC? = nil
    
    override func viewDidLoad() {
        
        //facebookLoginButton.delegate = self
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print("douh" )
        }else if result.isCancelled{
            print("user cancelled" )
        }else{
            print(result.token.tokenString)
            print(result.token.permissions)
            print(result.token.userID)
            print(result.token.expirationDate)
            print(result.grantedPermissions)
            
            //http://swiftdeveloperblog.com/code-examples/fetch-facebook-user-profile-details-in-swift/
            //https://blog.risingstack.com/node-hero-node-js-unit-testing-tutorial/
            
            //https://app.instapage.com/auth/login
            //https://app.instapage.com/api/2/pages/get-user-pages
        }
    }
    func fetchUserProfile()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error took place: \(error)")
            }else{
                /*print("Print entire fetched result: \(result)")
                
                let id : NSString = result.valueForKey("id") as! String
                print("User ID is: \(id)")
                
                if let userName = result.valueForKey("name") as? String
                {
                    self.userFullName.text = userName
                }*/
            }
            
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user logout" )
    }
    
    @IBAction func showSignUpScreen(_ sender: Any) {
        if parentVC != nil{
            parentVC?.showSignUpScreen()
        }
    }
    
    @IBAction func signInWithoutUser(_ sender: Any) {
        if parentVC != nil{
            parentVC?.signInWithoutUser()
        }
    }
}

