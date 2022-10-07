//
//  AdminLogin.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 27/07/2022.
//

import Foundation
import Foundation
import ObjectMapper

class AdminData : Mappable {
    var body : AdminBody?
    var message : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        body <- map["body"]
        message <- map["message"]
    }

}
class AdminBody : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var phone : String?
    var email : String?
    var displayName : String?
    var password : String?
    var phoneCountryDialCode : String?
    var socialFacebookId : String?
    var socialGoogleId : String?
    var socialAppleId : String?
    var socialZaloId : String?
    var follower : Int?
    var avatarId : String?
    var avatar : String?
    var gender : String?
    var address : String?
    var status : Int?
    var birthday : String?
    var wallet : Int?
    var score : Int?
    var total_score : Int?
    var totalWallet : Int?
    var verified : Bool?
    var roleId : Int?
    var role : AdminRole?
    var accessToken : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        phone <- map["phone"]
        email <- map["email"]
        displayName <- map["displayName"]
        password <- map["password"]
        phoneCountryDialCode <- map["phoneCountryDialCode"]
        socialFacebookId <- map["socialFacebookId"]
        socialGoogleId <- map["socialGoogleId"]
        socialAppleId <- map["socialAppleId"]
        socialZaloId <- map["socialZaloId"]
        follower <- map["follower"]
        avatarId <- map["avatarId"]
        avatar <- map["avatar"]
        gender <- map["gender"]
        address <- map["address"]
        status <- map["status"]
        birthday <- map["birthday"]
        wallet <- map["wallet"]
        score <- map["score"]
        total_score <- map["total_score"]
        totalWallet <- map["totalWallet"]
        verified <- map["verified"]
        roleId <- map["roleId"]
        role <- map["role"]
        accessToken <- map["accessToken"]
    }

}
class AdminRole : Mappable {
    var id : Int?
    var name : String?
    var displayName : String?
    var description : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        displayName <- map["displayName"]
        description <- map["description"]
    }

}
