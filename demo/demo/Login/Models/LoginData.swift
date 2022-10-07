//
//  LoginData.swift
//  demo
//
//  Created by bùi thành công on 15/07/2022.
//

import Foundation
import ObjectMapper

class Avatar : Mappable {
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

//class Data : Mappable {
//    var createdAt : String?
//    var updatedAt : String?
//    var deleted : Bool?
//    var id : Int?
//    var email : String?
//    var laravelUserId : String?
//    var accessTokenLaravel : String?
//    var deviceKey : String?
//    var name : String?
//    var avatarId : Int?
//    var role : Int?
//    var totalAmount : Int?
//    var firstSurvey : Bool?
//    var verifiedEmail : Bool?
//    var avatar : Avatar?
//    var status : Int?
//    var accessToken : String?
//    var lastSub : LastSub?
//
//    required init?(map: Map) {
//
//    }
//    init(){}
//
//    func mapping(map: Map) {
//
//        createdAt <- map["createdAt"]
//        updatedAt <- map["updatedAt"]
//        deleted <- map["deleted"]
//        id <- map["id"]
//        email <- map["email"]
//        laravelUserId <- map["laravelUserId"]
//        accessTokenLaravel <- map["accessTokenLaravel"]
//        deviceKey <- map["deviceKey"]
//        name <- map["name"]
//        avatarId <- map["avatarId"]
//        role <- map["role"]
//        totalAmount <- map["totalAmount"]
//        firstSurvey <- map["firstSurvey"]
//        verifiedEmail <- map["verifiedEmail"]
//        avatar <- map["avatar"]
//        status <- map["status"]
//        accessToken <- map["accessToken"]
//        lastSub <- map["lastSub"]
//    }
//
//}

class Json4Swift_Base : Mappable {
    var data : Data?
    var message : String?

    required init?(map: Map) {

    }
    init(){}

    func mapping(map: Map) {

        data <- map["data"]
        message <- map["message"]
    }

}

class LastSub : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var packId : Int?
    var ownerId : Int?
    var name : String?
    var title : String?
    var expiredDate : String?
    var limitArticle : Int?
    var status : Int?
    var remainsArticle : Int?

    required init?(map: Map) {

    }
    init(){}

    func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        packId <- map["packId"]
        ownerId <- map["ownerId"]
        name <- map["name"]
        title <- map["title"]
        expiredDate <- map["expiredDate"]
        limitArticle <- map["limitArticle"]
        status <- map["status"]
        remainsArticle <- map["remainsArticle"]
    }

}
class MessageType : Mappable {
    var message : String?

    required init?(map: Map) {}
    init(){}

    func mapping(map: Map) {
        message <- map["message"]
    }
}





