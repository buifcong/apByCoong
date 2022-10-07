//
//  BookCollectionViewCell.swift
//  demo
//
//  Created by bùi thành công on 14/07/2022.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ivBook: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbNameBook: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Corner(view: [ivBook], corner: 8)
    }
    var itemCollectionBook:DataBook?{
        didSet{
            ivBook.load(url: itemCollectionBook?.media?.thumbUrl)
            lbNameBook.text = "\(itemCollectionBook?.title ?? "")"
            lbPrice.text = "\(itemCollectionBook?.price ?? 0)"
        }
    }

}
