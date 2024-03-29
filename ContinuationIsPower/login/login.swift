//
//  login.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/11/07.
//  Copyright © 2019 笹倉一也. All rights reserved.
//


import UIKit
import Firebase



class login: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        emailTF.delegate = self
        passTF.delegate = self
    
        
  
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        
        Auth.auth().signIn(withEmail: emailTF.text!, password: passTF.text!) { (user, error) in
               
               
               if let error = error {
                   print(error.localizedDescription)
                   return
               }
               
               print("login success")
            
            
    if let _ = Auth.auth().currentUser {
        
           let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as! UITabBarController
        
        secondViewController.modalPresentationStyle = .fullScreen
        
           self.present(secondViewController, animated: true, completion: nil)
           
               }
               
           
        }
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         
        emailTF.resignFirstResponder()
            
        passTF.resignFirstResponder()
        
        return true
        
        
        
    }
    
    
    

 

}
