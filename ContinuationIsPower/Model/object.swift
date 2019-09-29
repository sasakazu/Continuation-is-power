//
//  object.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/09/18.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import Foundation


class Set {
    
    
    var setName:String = ""

    var kg1:String = ""
    var rep1:String = ""
    
    var kg2:String = ""
    var rep2:String = ""
   
    var kg3:String = ""
    var rep3:String = ""
    
    var kg4:String = ""
    var rep4:String = ""
    
    var kg5:String = ""
    var rep5:String = ""
    
    var alphaKg:String = ""
    var alphaRep:String = ""
    
    var postid:String = ""
    
    init(setname: String,
         kg1:String, rep1:String,
         kg2:String, rep2:String,
         kg3:String, rep3:String,
         kg4:String, rep4:String,
         kg5:String, rep5:String,
         alphaKg:String, alphaRep:String, postid:String) {
        
         self.setName = setname
        
         self.kg1 = kg1
         self.rep1 = rep1
        
         self.kg2 = kg2
         self.rep2 = rep2
        
         self.kg3 = kg3
         self.rep3 = rep3
        
         self.kg4 = kg4
         self.rep4 = rep4
        
         self.kg5 = kg5
         self.rep5 = rep5
        
         self.alphaKg = alphaKg
         self.alphaRep = alphaRep
        
         self.postid = postid
        
        
        
    }
    
}
