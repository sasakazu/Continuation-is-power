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
    
    
    let item = ["kdkl", "mdvd;l"]

    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
        cell.textLabel!.text = item[indexPath.row]
        
        return cell
        
    }

}
