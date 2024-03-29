//
//  Banner.swift
//  demo
//
//  Created by bùi thành công on 18/07/2022.
//

import Foundation
import ObjectMapper

class DataBook : Mappable {
    var deleted : Bool?
    var id : Int?
    var title : String?
    var subTitle : String?
    var author : String?
    var slug : String?
    var ownerId : Int?
    var type : Int?
    var price : Int?
    var hot : Bool?
    var media : MediaBanner?
    var viewCount : Int?
    var bought : Bool?
    var rating : Double?
    var totalChapter : Int?
    var favorite : Bool?
    var isPublic : Bool?

    required init?(map: Map) {

    }
    init(){}

    func mapping(map: Map) {

        deleted <- map["deleted"]
        id <- map["id"]
        title <- map["title"]
        subTitle <- map["subTitle"]
        author <- map["author"]
        slug <- map["slug"]
        ownerId <- map["ownerId"]
        type <- map["type"]
        price <- map["price"]
        hot <- map["hot"]
        media <- map["media"]
        viewCount <- map["viewCount"]
        bought <- map["bought"]
        rating <- map["rating"]
        totalChapter <- map["totalChapter"]
        favorite <- map["favorite"]
        isPublic <- map["public"]
    }

}
class BookData : Mappable {
    var data : [DataBook]?
    var message : String?

    required init?(map: Map) {

    }
    init(){}

    func mapping(map: Map) {

        data <- map["data"]
        message <- map["message"]
    }

}
class MediaBanner : Mappable {
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

