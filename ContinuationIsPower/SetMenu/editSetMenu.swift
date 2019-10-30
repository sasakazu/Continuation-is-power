//
//  editSetMenu.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/10/30.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class editSetMenu: UIViewController {
    
    
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
        
        print(editID)
        
        let db = Firestore.firestore()
              
              db.collection("myset").document(editID)
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
        
        
        
    }
    
    


}
