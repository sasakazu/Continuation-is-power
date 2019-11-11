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
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        enailTF.delegate = self
        passTF.delegate = self

        
    }
    


    
    @IBAction func signUp(_ sender: Any) {
        
        
        let email = enailTF.text
        let password = passTF.text
           
        let db = Firestore.firestore()
           
           
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
            
            
          
               
            
               
        let newUser = [

            "email": email,
            "userID": user?.user.uid,
            "password": password

               ]



    db.collection("users").document((user?.user.uid)!).collection("userInfo").document().setData(newUser as [String : Any]) { err in

                if let err = err {
                    print("Error writing document: \(err)")
                }

                else {
                    print("Document successfully written!")
                    
                    
                    if let _ = Auth.auth().currentUser {
                          
                             let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as! UITabBarController
                          
                          secondViewController.modalPresentationStyle = .fullScreen
                          
                             self.present(secondViewController, animated: true, completion: nil)
                          
                      
                                
                             
                                 }
                    
                }


               }

           }
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           
          enailTF.resignFirstResponder()
              
          passTF.resignFirstResponder()
          
          return true
          
          
          
      }
    
    
    
    
}
