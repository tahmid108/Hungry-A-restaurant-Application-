//
//  JsonModel.swift
//  swiftyjson
//
//  Created by Yogesh Patel on 16/04/18.
//  Copyright © 2018 Yogesh Patel. All rights reserved.
//

import Foundation

struct JsonModel{
    var foodName: String = ""
    var price: String = ""
    var restName: String = ""
    var artwork: String = ""
    init(){
        
    }
    
    init(json:JSON){
        foodName = json["foodName"].stringValue
        price = json["price"].stringValue
        restName = json["restName"].stringValue
        artwork = json["artwork"].stringValue
        
    }
}

