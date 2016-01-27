//
//  ViewController.swift
//  ParseGoogleAuth
//
//  Created by Daniel Carlos on 1/18/16.
//
//

import UIKit

class ViewController: UIViewController,GIDSignInDelegate, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if(error != nil){
            print(error)
            return
        }
        
        let gToken = user.authentication.accessToken
        
        PFCloud.callFunctionInBackground("accessGoogleUser", withParameters: ["accessToken":gToken]){
            (sessionToken, error)  in
            if error != nil {
                print(error)
                return
            }

            PFUser.becomeInBackground(sessionToken as! String){
                (user, error)  in
                if error == nil {
                    print(user)
                }else{
                    print(error)
                }
            }
        }
    
    }
    
    @IBAction func logOutParse() {
        PFUser.logOut()
    }
    
}

