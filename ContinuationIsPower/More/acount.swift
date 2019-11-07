//
//  acount.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/11/07.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase



class acount: UIViewController {
    
    
    @IBOutlet weak var uidLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let user = Auth.auth().currentUser
             
         if let user = user {
            let uid = user.uid
           
             
            uidLabel.text = uid
        
        
        }

    }
    

  

}
