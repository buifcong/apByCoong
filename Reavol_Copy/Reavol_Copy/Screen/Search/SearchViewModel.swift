//
//  SearchViewModel.swift
//  Reavol_copy
//
//  Created by bùi thành công on 05/10/2022.
//

import Foundation
import Alamofire
class SearchViewModel {
    var isLoading: Bool = false {
        didSet {
            isLoadingUpdated?(isLoading)
        }
    }
    var isLoadingUpdated: ((_ isLoading: Bool) -> Void)?
    
    var error: String? {
        didSet {
            errorUpdated?(error ?? "")
        }
    }
    var errorUpdated: ((_ error: String) -> Void)?
    var success: String? {
        didSet {
            successUpdated?(success ?? "")
        }
    }
    var successUpdated: ((_ success: String) -> Void)?
    
    var arrBook: [BookResponse] = []{
        didSet{
            arrBookUpdate?()
        }
    }
    var arrBookUpdate:(()-> Void)?
    func fetch(){
        getListBooks(isLoadMore: false)
    }
    
    var countItem = 0
    var page: Int = 0
    func getListBooks(isLoadMore: Bool) {
        self.isLoading = true
        if !isLoadMore {
            page = 0
            countItem = 0
        }
        let param = ["categoryId":"1","page":"\(page)"]
        AF.request("https://api-dev.ungdungdocnhanh.com/api/v1/article/get-articles-in-category",method:.get,parameters: param,encoding: URLEncoding.default).responseJSON {[weak self] response  in
            self?.page += 1
            self?.isLoading = false
            if let response = response.value as? [String:Any] {
                if let result = response["data"] as? [[String:Any]] {
                    if isLoadMore == true {
                        self?.arrBook += [BookResponse](JSONArray:result)
                    } else {
                        self?.arrBook = [BookResponse](JSONArray:result)
                    } 
                }
            } else {
                self?.errorUpdated?("error call API")
            }
        }
        
    }
}
