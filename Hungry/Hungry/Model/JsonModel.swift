

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

