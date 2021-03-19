//
//  ModelClass.swift
//  Hungry
//
//  Created by kuet on 28/11/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import Foundation

class ModelClass {
    
    var id: Int
    var name: String?
    var password: String?
    
    init(id: Int, name: String?, password: String?){
        self.id = id
        self.name = name
        self.password = password
    }
}
