//
//  addSetMenu.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/11.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class addSetMenu: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    
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
    
//    @IBOutlet weak var memoView: UITextView!
    
    @IBOutlet weak var goalTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        memoView.layer.cornerRadius = 3.0
        
        goalTF.layer.cornerRadius = 3.0
        
        setmenuTF.delegate = self
        
        kg1.delegate = self
        rep1.delegate = self
    
        kg2.delegate = self
        rep2.delegate = self
        
        kg3.delegate = self
        rep3.delegate = self
        
        kg4.delegate = self
        rep4.delegate = self
        
        kg5.delegate = self
        rep5.delegate = self
        
        alphaKG.delegate = self
        alphaRep.delegate = self
    
//        memoView.delegate = self
        
        goalTF.delegate = self
        
        
    }
    


    @IBAction func saveBtn(_ sender: Any) {
        
         let db = Firestore.firestore()
        
        let postid = NSUUID().uuidString
        
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
            "プラスアルファRep": alphaRep.text ?? "",
            "メモ": goalTF.text ?? "",
            
            "PostID": postid 
            
            
            ]

      
        
        db.collection("myset").document(postid).setData(docData) { err in
         
            
            
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        setmenuTF.resignFirstResponder()
        
        kg1.resignFirstResponder()
        rep1.resignFirstResponder()
        
        kg2.resignFirstResponder()
        rep2.resignFirstResponder()
        
        kg3.resignFirstResponder()
        rep3.resignFirstResponder()
        
        kg4.resignFirstResponder()
        rep4.resignFirstResponder()
        
        kg5.resignFirstResponder()
        rep5.resignFirstResponder()
        
        alphaKG.resignFirstResponder()
        alphaRep.resignFirstResponder()
        
//        memoView.resignFirstResponder()
        goalTF.resignFirstResponder()
        
        
        
        return true
    
    
    }
    
}

