//
//  mySet.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/10.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase



class mySet: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var setItem = [Set]()
    
    var getPostId:String = ""
    
    

    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let db = Firestore.firestore()
        
//        let user = Auth.auth().currentUser
        
        let ref = db.collection("myset")
        
        ref.addSnapshotListener(includeMetadataChanges: true){ (document, error) in
            
            
            
            guard let value = document else {
                print("snapShot is nil")
                return
            }
            
            
            value.documentChanges.forEach{ postdiff in
                
                if postdiff.type == .added {
                    
                    
                    
                    let chatDataOp = postdiff.document.data() as? Dictionary<String, Any>
                    
                    
                    guard let chatData = chatDataOp else {
                        return
                    }
                    
                    
                    let setname = chatData["セットネーム"] as? String
                    
                    let kg1 = chatData["1セットKG"] as? String
                    let rep1 = chatData["1セットRep"] as? String
                    
                    let kg2 = chatData["2セットKG"] as? String
                    let rep2 = chatData["2セットRep"] as? String
                    
                    let kg3 = chatData["3セットKG"] as? String
                    let rep3 = chatData["3セットRep"] as? String
                    
                    let kg4 = chatData["4セットKG"] as? String
                    let rep4 = chatData["4セットRep"] as? String
                    
                    let kg5 = chatData["5セットKG"] as? String
                    let rep5 = chatData["5セットRep"] as? String
                    
                    let alphakg = chatData["プラスアルファKG"] as? String
                    let alpharep = chatData["プラスアルフアRep"] as? String
                    
                    let postid = chatData["PostID"] as? String
                    
                    
                    
                    let newSourse = Set(setname: setname ?? "", kg1: kg1 ?? "", rep1: rep1 ?? "", kg2: kg2 ?? "", rep2: rep2 ?? "", kg3: kg3 ?? "", rep3: rep3 ?? "", kg4: kg4 ?? "", rep4: rep4 ?? "", kg5: kg5 ?? "", rep5: rep5 ?? "", alphaKg: alphakg ?? "", alphaRep: alpharep ?? "", postid: postid ?? "")
                    
                    self.setItem.append(newSourse)
                    
                    self.tableview.reloadData()
                    
                }

            }
            
        }
    
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setItem.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
        cell.textLabel!.text = setItem[indexPath.row].setName
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.getPostId = setItem[indexPath.row].postid
        
        
        print(getPostId)
        
        self.performSegue(withIdentifier: "goDetail",sender: nil)

        
    }
    
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
            
            
            if editingStyle == UITableViewCell.EditingStyle.delete {
            
            let db = Firestore.firestore()
                
            self.getPostId = setItem[indexPath.row].postid
            
            db.collection("myset").document(getPostId).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    
                    self.setItem.remove(at: indexPath.row)
                   
                    tableView.deleteRows(at: [indexPath], with: .fade)

                    
                    print("Document successfully removed!")
                }
            }
        
        
        }
    }
    
    
//    send id
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goDetail") {
            let secondVC: setMenuDetail = (segue.destination as? setMenuDetail)!
            
            
            secondVC.getID = getPostId
        }
    }
    
    
    

}
