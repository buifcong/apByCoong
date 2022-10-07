//
//  Data1.swift
//  demo
//
//  Created by bùi thành công on 15/07/2022.
//

import Foundation
import ObjectMapper

class Category : Mappable {
    var data : [Data2]?
    var message : String?

    required init?(map: Map) {

    }
    init(){
        
    }

    func mapping(map: Map) {

        data <- map["data"]
        message <- map["message"]
    }
}
class Data2 : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var parentId : String?
    var iconId : String?
    var imageId : String?
    var name : String?
    var subTitle : String?
    var type : Int?
    var sort : Int?
    var status : String?
    var icon : Icon?
    var image : String?
    var articles : String?

    required init?(map: Map) {

    }
    init(){
        
    }

    func  mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        parentId <- map["parentId"]
        iconId <- map["iconId"]
        imageId <- map["imageId"]
        name <- map["name"]
        subTitle <- map["subTitle"]
        type <- map["type"]
        sort <- map["sort"]
        status <- map["status"]
        icon <- map["icon"]
        image <- map["image"]
        articles <- map["articles"]
    }

}
class Icon : Mappable {
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
    init(){
        
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
