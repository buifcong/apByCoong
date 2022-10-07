//
//  PustViewController.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 25/07/2022.
//

import UIKit
import Alamofire
import ObjectMapper
class PustViewController: UIViewController {
    
    var accessToken:String = ""
    var headers: HTTPHeaders?
    let param = ["deviceKey":"\(UIDevice.current.identifierForVendor!.uuidString)",
                 "firebaseToken":"\(User.FCMToken)",
                 "appVersion":"apple",
                 "osType":"IOS"]
    let param2 = ["title":"test23",
                  "content":"test23asdasdasdasd"]
    let param3 = ["title":"xongádasdasdasd",
                  "content":"aloalogxgfsxfgx",
                  "fcmToken":"c2xwDbtgZ0LprfeLNuY6Hz:APA91bECbbyj9IKBCVDKrm8-jcth_ZiJUfa5CqHjtLK7iOJlC7B6jDjh14wyw2NHt89KdSUv_TwTZvHkZHw_vZxencjlmX0hLchXo35Zs_E0726XTumZJVuzZFYXKxbIO9eZJdXBuIPe",
                  "receiverType":"0"]
    
    @IBOutlet weak var btnPushNotify: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(accessToken)

      
    }

    @IBAction func actionPushNotify(_ sender: Any) {

        AF.request("http://192.168.1.231:8080/api/v1/device/add", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers, interceptor: nil, requestModifier: nil).responseJSON { response in
            print(response)
            print(self.param)

        }
//        AF.request("http://192.168.1.231:8080/api/admin/v1/notification/add", method: .post, parameters: param2, encoding: JSONEncoding.default, headers: headers, interceptor: nil, requestModifier: nil).responseJSON { response in
//            print(response)
//        }
        AF.request("http://192.168.1.231:8080/api/v1/notification/fcm-push", method: .post, parameters: param3, encoding: JSONEncoding.default, headers: headers, interceptor: nil, requestModifier: nil).responseJSON { response in
            print(response)
        }
        
    }
    
 

}
