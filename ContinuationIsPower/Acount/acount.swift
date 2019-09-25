//
//  acount.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/25.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase



class acount: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser {
            
        
        
            emailLabel.text = user.email
        
        
        }

    }
    

  

}
