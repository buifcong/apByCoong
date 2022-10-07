//
//  InPosterCollectionViewCell.swift
//  demo
//
//  Created by bùi thành công on 18/07/2022.
//

import UIKit

class InPosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagePoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        Corner(view: [imagePoster], corner: 10)
        imagePoster.layer.cornerRadius = 10
    }
    var item:DataBuyVipRToken?{
        didSet{
            imagePoster.load(url: item?.logo?.thumbUrl)
        }
        
    }
}
