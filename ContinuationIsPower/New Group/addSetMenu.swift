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
    
    @IBOutlet weak var kg1: UITextField!
    @IBOutlet weak var rep1: UITextField!
    
    @IBOutlet weak var kg2: UITextField!
    @IBOutlet weak var rep2: UITextField!
    
    @IBOutlet weak var kg3: UITextField!
    @IBOutlet weak var rep3: UITextField!
    
    @IBOutlet weak var kg4: UITextField!
    @IBOutlet weak var rep4: UITextField!
    
    @IBOutlet weak var kg5: UITextField!
    @IBOutlet weak var rep5: UITextField!
    
    @IBOutlet weak var alphaKG: UITextField!
    @IBOutlet weak var alphaRep: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


    @IBAction func saveBtn(_ sender: Any) {
        
         let db = Firestore.firestore()
        
        
        
        let docData: [String: Any] = [
            "セットネーム": setmenuTF.text ?? "",
            "1セットKG": kg1.text ?? "",
            "1セットRep": rep1.text ?? "",
            "2セットKG": kg2.text ?? "",
            "2セットRep": rep2.text ?? "",
            "3セットKG": kg3.text ?? "",
            "3セットRep": rep3.text ?? "",
            "4セットKG": kg4.text ?? "",
            "4セットRep": rep4.text ?? "",
            "5セットKG": kg5.text ?? "",
            "5セットRep": rep5.text ?? "",
            "プラスアルファKG": alphaKG.text ?? "",
            "プラスアルファRep": alphaRep.text ?? ""
            
            
            ]

      
        
        db.collection("myset").document().setData(docData) { err in
         
            
            
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
    
    
    
    
    
    
}
