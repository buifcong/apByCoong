//
//  LoadMoreBook.swift
//  demo
//
//  Created by bùi thành công on 19/07/2022.
//


import Foundation
import ObjectMapper
class LoadMoreBookData : Mappable {
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
    var media : LoadMoreBookMedia?
    var viewCount : Int?
    var categoryName : String?
    var bought : Bool?
    var rating : Double?
    var totalChapter : Int?
    var favorite : Bool?
    var phublic : Bool?

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
        media <- map["media"]
        viewCount <- map["viewCount"]
        categoryName <- map["categoryName"]
        bought <- map["bought"]
        rating <- map["rating"]
        totalChapter <- map["totalChapter"]
        favorite <- map["favorite"]
        phublic <- map["public"]
    }


}
class LoadMoreBook : Mappable {
    var data : [LoadMoreBookData]?
    var message : String?

    required init?(map: Map) {}
    init(){}

    func mapping(map: Map) {

        data <- map["data"]
        message <- map["message"]
    }


}
class LoadMoreBookMedia :Mappable {
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

    required init?(map: Map) {}
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

