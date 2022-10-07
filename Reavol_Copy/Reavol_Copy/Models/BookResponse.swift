//
//  BookResponse.swift
//  Reavol_copy
//
//  Created by bùi thành công on 05/10/2022.
//

import Foundation
import ObjectMapper

class BoxBookResponse : Mappable {
    var data : [BookResponse]?
    var message : String?

    required init?(map: Map) {
    }
    
    init(){}

    func mapping(map: Map) {

        data <- map["data"]
        message <- map["message"]
    }

}

class BookResponse : Mappable {
    var createdAt : String?
    var deleted : Bool?
    var id : Int?
    var title : String?
    var subTitle : String?
    var author : String?
    var slug : String?
    var type : Int?
    var price : Int?
    var hot : Bool?
    var totalWords : Int?
    var media : Media?
    var viewCount : Int?
    var bought : Bool?
    var rating : Double?
    var totalChapter : Int?
    var favorite : Bool?
    var ppublic : Bool?

    required init?(map: Map) {
    }
    
    init(){}

    func mapping(map: Map) {

        createdAt <- map["createdAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        title <- map["title"]
        subTitle <- map["subTitle"]
        author <- map["author"]
        slug <- map["slug"]
        type <- map["type"]
        price <- map["price"]
        hot <- map["hot"]
        totalWords <- map["totalWords"]
        media <- map["media"]
        viewCount <- map["viewCount"]
        bought <- map["bought"]
        rating <- map["rating"]
        totalChapter <- map["totalChapter"]
        favorite <- map["favorite"]
        ppublic <- map["public"]
    }

}

class Media : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var originUrl : String?
    var thumbUrl : String?
    var type : Int?
    var width : String?
    var height : String?
    var duration : String?
    var size : String?
    var originName : String?

    required init?(map: Map) {
    }

    init(){}
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
