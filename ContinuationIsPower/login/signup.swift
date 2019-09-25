//
//  signup.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/25.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class signup: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passConfilmTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func signUp(_ sender: Any) {
        
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { user, err in
            
            if let err = err {
                print("Error writing document: \(err)")
            }
                
            else {
                print("Document successfully written!")
            }
            
            
            
        }
    }
    
    
    
    
    @IBAction func logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        
        }
        
    }
    
    
    
}
