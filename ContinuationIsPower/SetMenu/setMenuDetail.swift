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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(getID)
        
        setName.text = getID

        
        
    }
    

  

}
