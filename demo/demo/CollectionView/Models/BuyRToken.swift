//
//  BuyRToken.swift
//  demo
//
//  Created by bùi thành công on 18/07/2022.
//

import Foundation
import ObjectMapper

class DataBuyRToken : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var numToken : Int?
    var numDay : Int?
    var numArticle : String?
    var price : Int?
    var sort : Int?
    var logoId : String?
    var name : String?
    var title : String?
    var purchaseType : String?
    var content : String?
    var note : String?
    var prefix : String?
    var googleProductId : String?
    var appleProductId : String?
    var status : String?
    var type : Int?
    var logo : LogoBuyRToken?
    var priceLocalize : String?
    var subPriceLocalize : String?

    required init?(map: Map) {
    }
    init(numToken:Int,price:Int,url:LogoBuyRToken,note:String){
        self.numToken = numToken
        self.price = price
        self.logo = url
        self.note = note
    }

    func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        numToken <- map["numToken"]
        numDay <- map["numDay"]
        numArticle <- map["numArticle"]
        price <- map["price"]
        sort <- map["sort"]
        logoId <- map["logoId"]
        name <- map["name"]
        title <- map["title"]
        purchaseType <- map["purchaseType"]
        content <- map["content"]
        note <- map["note"]
        prefix <- map["prefix"]
        googleProductId <- map["googleProductId"]
        appleProductId <- map["appleProductId"]
        status <- map["status"]
        type <- map["type"]
        logo <- map["logo"]
        priceLocalize <- map["priceLocalize"]
        subPriceLocalize <- map["subPriceLocalize"]
    }

}
class BuyRToken : Mappable {
    var data : [DataBuyRToken]?
    var message : String?

    required init?(map: Map) {
    }
    init(){}

     func mapping(map: Map) {

        data <- map["data"]
        message <- map["message"]
    }

}
class LogoBuyRToken : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var originUrl : String?
    var thumbUrl : String?
    var type : Int?
    var width : Int?
    var height : Int?
    var duration : String?
    var size : Int?
    var originName : String?

    required init?(map: Map) {
    }
    init(thumbUrl:String){
        self.thumbUrl = thumbUrl
    }

     func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        originUrl <- map["originUrl"]
        thumbUrl <- map["thumbUrl"]
        type <- map["type"]
        width <- map["width"]
        height <- map["height"]
        duration <- map["duration"]
        size <- map["size"]
        originName <- map["originName"]
    }

}


