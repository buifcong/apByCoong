//
//  dataType.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import Foundation

class DataType {
    var bigImage = ""
    var bigTitle = ""
    var smallTitle = ""
    var price = ""
    
    init(image:String, bigTitle:String, smallTitle:String, price:String){
        self.bigImage = image
        self.bigTitle = bigTitle
        self.smallTitle = smallTitle
        self.price = price
    }
}
