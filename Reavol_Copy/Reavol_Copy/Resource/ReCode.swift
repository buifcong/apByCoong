//
//  ReCode.swift
//  Reavol_copy
//
//  Created by bùi thành công on 25/07/2022.
//

import Foundation
import UIKit
import MBProgressHUD

func cornerAndBorder(view:[UIView],corner:CGFloat,border:Bool,borderWith:CGFloat?,borderColor:CGColor?){
    for view in view {
        view.clipsToBounds = true
        view.layer.cornerRadius = corner
        if border == true {
            
            view.layer.borderWidth = borderWith ?? 0
            view.layer.borderColor = borderColor
        }
    }
}

func leftAndRightView(textField:[UITextField], x:CGFloat, y:CGFloat, width:CGFloat, heigh:CGFloat){
    for tf in textField {
        tf.leftView = UIView(frame: CGRect(x: x, y: y, width: width, height: heigh))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: x, y: y, width: width, height: heigh))
        tf.rightViewMode = .always
        
    }
    
}
func alertNoActionType(title:String?,message:String?,titleAction:String)->UIAlertController{
    let al = UIAlertController(title: title, message: message, preferredStyle: .alert)
    al.addAction(UIAlertAction(title: titleAction, style: .default))
    return al
}

extension UIViewController {
    func showLoading(text: String?){
        DispatchQueue.main.async {
            let progressHub = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHub.label.text = text ?? ""
            progressHub.contentColor = .darkGray
        }
    }
    func hiddenLoading(){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
