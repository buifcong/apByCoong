import Foundation
import UIKit
func corner(view: UIView, corner: CGFloat, border: CGFloat ){
    view.layer.cornerRadius = corner
    view.layer.masksToBounds = true
    view.layer.borderWidth = border
    
}
func alertNotActSh(title: String, message: String, action: String) -> UIAlertController {
    let al = UIAlertController(title: title, message: message, preferredStyle: .alert)
    al.addAction(UIAlertAction(title: action, style: .default))
    return al
}

