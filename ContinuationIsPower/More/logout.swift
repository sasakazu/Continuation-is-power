//
//  logout.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/11/09.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase


class logout: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func logout(_ sender: Any) {
        
        
        
        let firebaseAuth = Auth.auth()
               
               do {
                   try firebaseAuth.signOut()
                   
               
           } catch let signOutError as NSError {
           
               print ("Error signing out: %@", signOutError)
           
           }
           print("logout done!")
    }
    
    
    
    
    
    
    
}
