//
//  signup.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/11/07.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class signup: UIViewController, UITextFieldDelegate {
    
    
    var defaultStore : Firestore!
    
    @IBOutlet weak var enailTF: UITextField!
    
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet weak var passConfirmTF: UITextField!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        enailTF.delegate = self
        passTF.delegate = self
        passConfirmTF.delegate = self
        
        
        
    }
    


    
    @IBAction func signUp(_ sender: Any) {
        
        
        let email = enailTF.text
        let password = passTF.text
        let passConfirm = passConfirmTF.text
           
        let db = Firestore.firestore()
           
           
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
               
            
               
        let newUser = [
                   
            "email": email,
            "userID": user?.user.uid,
            "password": password,
            "passConfirm": passConfirm
                  
               ]
            

               
    db.collection("users").document((user?.user.uid)!).collection("userInfo").document().setData(newUser as [String : Any]) { err in
                   
                if let err = err {
                    print("Error writing document: \(err)")
                }
                   
                else {
                    print("Document successfully written!")
                }
               
               
               }

           }
        
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
