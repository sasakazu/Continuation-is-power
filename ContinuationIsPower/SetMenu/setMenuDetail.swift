//
//  setMenuDetail.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/11.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase


class setMenuDetail: UIViewController {
    
    
    var getID:String = ""
    
    @IBOutlet weak var setName: UILabel!
    
    @IBOutlet weak var oneKG: UILabel!
    @IBOutlet weak var oneRep: UILabel!
    
    @IBOutlet weak var twoKG: UILabel!
    @IBOutlet weak var twoRep: UILabel!
    
    @IBOutlet weak var threeKG: UILabel!
    @IBOutlet weak var threeRep: UILabel!
    
    @IBOutlet weak var fourKG: UILabel!
    @IBOutlet weak var fourRep: UILabel!
    
    @IBOutlet weak var fiveKG: UILabel!
    @IBOutlet weak var fiveRep: UILabel!
    
    @IBOutlet weak var alphaKG: UILabel!
    @IBOutlet weak var alphaRep: UILabel!
    
    @IBOutlet weak var memoView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoView.layer.cornerRadius = 5.0
        
       
        let db = Firestore.firestore()
        
        db.collection("myset").document(getID)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                
                self.setName.text = document["セットネーム"] as? String
                
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
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "goEditView") {
             let editVC: editSetMenu = (segue.destination as? editSetMenu)!
             
             
             editVC.editID = getID
         }
     }

  

}
