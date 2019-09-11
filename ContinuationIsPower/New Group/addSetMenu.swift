//
//  addSetMenu.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/11.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class addSetMenu: UIViewController {
    
    
    @IBOutlet weak var setmenuTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


    @IBAction func saveBtn(_ sender: Any) {
        
         let db = Firestore.firestore()
        
        let setname = setmenuTF.text
      
        
        db.collection("myset").document().setData([
            "セットネーム": setname ?? ""
         
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
    
    
    
    
    
    
}
