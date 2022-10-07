//
//  CustomCollectionViewCell.swift
//  demo
//
//  Created by bùi thành công on 14/07/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    }
    func design(){
        Corner(view: [view1,view2,view3], corner: 10)
    }

}
