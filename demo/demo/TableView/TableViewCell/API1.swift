//
//  API1.swift
//  demo
//
//  Created by bùi thành công on 15/07/2022.
//

import Foundation
import HandyJSON

class IconType{
    var createdAt: String?
    var updatedAt: String?
    var deleted: Bool?
    var id: Int?
    var  originUrl: String?
    var thumbUrl: String?
    var type: Int?
    var width: Int?
    var height: Int?
    var duration: String?
    var size: Int?
    var originName: String?
    
    init(createdAt:String, updatedAt: String, deleted: Bool, id: Int, originUrl: String, thumbUrl: String, type: Int, width: Int, height: Int, duration: String, size: Int, originName: String){
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deleted = deleted
        self.id = id
        self.originUrl = originUrl
        self.thumbUrl = thumbUrl
        self.type = type
        self.width = width
        self.height = height
        self.duration = duration
        self.size = size
        self.originName = originName
        
    }
    required init() {}
}
class InformationType{
    var createdAt: String?
    var updatedAt: String?
    var deleted: Bool?
    var id: Int?
    var parentId: String?
    var iconId: String?
    var imageId: String?
    var name: String?
    var subTitle: String?
    var type: Int?
    var sort: Int?
    var status: String?
    var icon:IconType?
    var image: String?
    var articles: String?
    init(createdAt: String, updatedAt: String, deleted: Bool, id: Int, parentId: String, iconId: String, imageId: String, name: String, subTitle: String, type: Int, sort: Int, status: String, icon:IconType, image: String, articles: String){
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deleted = deleted
        self.id = id
        self.parentId = parentId
        self.iconId = iconId
        self.imageId = imageId
        self.name = name
        self.subTitle = subTitle
        self.type = type
        self.sort = sort
        self.status = status
        self.icon = icon
        self.image = image
        self.articles = articles
        
    }
    required init() {}
}
class DataFromAPType{
    var data: InformationType?
    var message: String?
    init(data:InformationType, message: String){
        self.data = data
        self.message = message
    }
    required init() {}
}
