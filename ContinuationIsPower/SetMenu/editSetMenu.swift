//
//  editSetMenu.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/10/30.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class editSetMenu: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    var editID:String = ""
    
    @IBOutlet weak var editName: UITextField!
    
    @IBOutlet weak var oneKG: UITextField!
    @IBOutlet weak var oneRep: UITextField!
    
    @IBOutlet weak var twoKG: UITextField!
    @IBOutlet weak var twoRep: UITextField!
   
    @IBOutlet weak var threeKG: UITextField!
    @IBOutlet weak var threeRep: UITextField!
    
    @IBOutlet weak var fourKG: UITextField!
    @IBOutlet weak var fourRep: UITextField!
    
    @IBOutlet weak var fiveKG: UITextField!
    @IBOutlet weak var fiveRep: UITextField!
    
    @IBOutlet weak var alphaKG: UITextField!
    @IBOutlet weak var alphaRep: UITextField!
    
    @IBOutlet weak var memoView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editName.delegate = self
        
        oneKG.delegate = self
        oneRep.delegate = self
        
        twoKG.delegate = self
        twoRep.delegate = self
        
        threeKG.delegate = self
        threeRep.delegate = self
        
        fourKG.delegate = self
        fourRep.delegate = self
        
        fiveKG.delegate = self
        fiveRep.delegate = self
        
        alphaKG.delegate = self
        alphaRep.delegate = self
        
        memoView.delegate = self
        
        memoView.layer.cornerRadius = 5
        
        
        let currentuser = Auth.auth().currentUser
        
        print(editID)
        
        let db = Firestore.firestore()
              
        db.collection("users").document(currentuser!.uid).collection("setmenu").document(editID)
                  .addSnapshotListener { documentSnapshot, error in
                      guard let document = documentSnapshot else {
                          print("Error fetching document: \(error!)")
                          return
                      }
                      guard let data = document.data() else {
                          print("Document data was empty.")
                          return
                      }
                   
                      
                      self.editName.text = document["セットネーム"] as? String
                      
                      self.oneKG.text = document["1セットKG"] as? String
                      self.oneRep.text = document["1セットRep"] as? String
                      self.twoKG.text = document["2セットKG"] as? String
                      self.twoRep.text = document["2セットRep"] as? String
                      self.threeKG.text = document["3セットKG"] as? String
                      self.threeRep.text = document["3セットRep"] as? String
                    
                      self.fourKG.text = document["4セットKG"] as? String
                      self.fourRep.text = document["4セットRep"] as? String
        
     
                    self.fiveKG.text = document["5セットKG"] as? String
                    self.fiveRep.text = document["5セットRep"] as? String
                       
                    
                    self.alphaKG.text = document["プラスアルファKG"] as? String
                    self.alphaRep.text = document["プラスアルファRep"] as? String
                    
                    self.memoView.text = document["メモ"] as? String
                    
        }
                    
    }
    
 
    
    @IBAction func update(_ sender: Any) {
        
        

          let db = Firestore.firestore()
          
          let currentuser = Auth.auth().currentUser
       
          
          let docData: [String: Any] = [
              "セットネーム": editName.text ?? "",
       
              "1セットKG": oneKG.text ?? "",
              "1セットRep": oneRep.text ?? "",
       
              "2セットKG": twoKG.text ?? "",
              "2セットRep": twoRep.text ?? "",
              
              "3セットKG": threeKG.text ?? "",
              "3セットRep": threeRep.text ?? "",
              
              "4セットKG": fourKG.text ?? "",
              "4セットRep": fourRep.text ?? "",
              
              "5セットKG": fiveKG.text ?? "",
              "5セットRep": fiveRep.text ?? "",
              
              "プラスアルファKG": alphaKG.text ?? "",
              "プラスアルファRep": alphaRep.text ?? "",
              
              "メモ": memoView.text ?? "",
              
              
              
              ]

        
          
        db.collection("users").document(currentuser!.uid).collection("setmenu").document(editID).updateData(docData) { err in
           
              
              
              if let err = err {
                  print("Error writing document: \(err)")
              } else {
                  print("Document successfully update!")
              }
          }
          
          self.navigationController?.popToRootViewController(animated: true)
          
          
        
        
        
    }
    
    

    
    
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           
            editName.resignFirstResponder()
            
            oneKG.resignFirstResponder()
            oneRep.resignFirstResponder()
            

            twoKG.resignFirstResponder()
            twoRep.resignFirstResponder()

            threeKG.resignFirstResponder()
            threeRep.resignFirstResponder()

            fourKG.resignFirstResponder()
            fourRep.resignFirstResponder()

            fiveKG.resignFirstResponder()
            fiveRep.resignFirstResponder()
            
            alphaKG.resignFirstResponder()
            alphaRep.resignFirstResponder()
            
   
//            memoView.resignFirstResponder()
            
            
            
            return true
        
        
        }
    
    

    
    

}
