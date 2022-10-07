//
//  NotificationModels.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 22/07/2022.
//

import Foundation
import ObjectMapper
class emailLogin : Mappable {
    var email : String?
    var password : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        email <- map["email"]
        password <- map["password"]
    }

}
