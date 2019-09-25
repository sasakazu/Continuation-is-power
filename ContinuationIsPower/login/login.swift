//
//  login.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/25.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class login: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

 
    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("login success")
            
            
        }

        
    }
    
}
