//
//  CustomTableViewCell.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imgBig: UIImageView!
    @IBOutlet weak var lbBig: UILabel!
    @IBOutlet weak var lbSmall: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var btnBuy: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       design()
    }
    
    func design(){
        Corner(view: [btnBuy], corner: btnBuy.frame.height/2)
        Corner(view: [imgBig], corner: 10)
    }
    
    var item: DataType? {
        didSet {
            lbBig.text = item?.bigTitle
            imgBig.image = UIImage(named: item?.bigImage ?? "")
            lbSmall.text = item?.smallTitle
            lbPrice.text = item?.price
        }
    }
    var item2: LoadMoreBookData? {
        didSet{
            lbBig.text = item2?.title
            lbSmall.text = item2?.subTitle
            lbPrice.text = "\(item2?.price ?? 0)"
            imgBig.load(url: item2?.media?.thumbUrl)
        }
    }
    
}
