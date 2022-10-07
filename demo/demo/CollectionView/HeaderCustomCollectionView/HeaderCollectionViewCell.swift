//
//  HeaderCollectionViewCell.swift
//  demo
//
//  Created by bùi thành công on 14/07/2022.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var itemC: hearderCollectionType? {
        didSet{
            lbTitle.text = itemC?.nameTitle
        }
    }

}
