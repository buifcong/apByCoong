//
//  LoginDataTyping.swift
//  demo
//
//  Created by bùi thành công on 15/07/2022.
//

import Foundation
import HandyJSON
class LoginType:HandyJSON{
    var data = DataLoginType()
    var mesage: String?
    required init(){}
}
class DataLoginType:HandyJSON{
    var createdAt = ""
    var updatedAt = ""
    var deleted = false
    var id = 0
    var email = ""
    var laravelUserId = ""
    var accessTokenLaravel = ""
    var deviceKey = ""
    var name = ""
    var avatarId = 0
    var role = 0
    var totalAmount = 0
    var firstSurvey = false
    var verifiedEmail = false
    var avatar = AvatarType()
    var status = 0
    var accessToken = ""
    var lastSub = LastSubType()
    required init(){}
}
class AvatarType:HandyJSON{
    var createdAt = ""
    var updatedAt = ""
    var deleted = false
    var id = 0
    var originUrl = ""
    var thumbUrl = ""
    var type = 0
    var width: String?
    var height: String?
    var duration: String?
    var size: String?
    var originName: String?
    required init(){}
}
class LastSubType:HandyJSON{
    var createdAt = ""
    var updatedAt = ""
    var deleted = false
    var id = 0
    var packId = 0
    var ownerId = 0
    var name = ""
    var title = ""
    var expiredDate = ""
    var limitArticle = 0
    var status = 0
    var remainsArticle = 0
    required init(){}
}
