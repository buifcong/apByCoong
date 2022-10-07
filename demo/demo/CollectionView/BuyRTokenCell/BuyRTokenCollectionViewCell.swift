//
//  BuyRTokenCollectionViewCell.swift
//  demo
//
//  Created by bùi thành công on 18/07/2022.
//

import UIKit

class BuyRTokenCollectionViewCell: UICollectionViewCell {
    var note: String?
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var lbHot: UILabel!
    @IBOutlet weak var ivCoin: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var btPrice: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
//        note = "a"
        Corner(view: [btPrice], corner: btPrice.frame.height/2)
        Corner(view: [bigView,lbHot], corner: 10)
        btPrice.layer.borderWidth = 1
        btPrice.layer.borderColor = UIColor.init(hex: "#33BF71").cgColor
        
        
        
    }
    
    var item: DataBuyRToken? {
        didSet {
            note = item?.note
            btPrice.setTitle("\(item?.price ?? 0) đ", for: .normal)
            lbPrice.text = "\(item?.numToken ?? 0)"
            ivCoin.load(url: item?.logo?.thumbUrl)
            if note != nil && note != "" {
                lbHot.isHidden = false
                lbHot.layer.maskedCorners = [.layerMaxXMaxYCorner]
                btPrice.backgroundColor = UIColor(named: "buyColor")
    //            btPrice.titleLabel?.textColor = .white
                btPrice.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
                
            }else{
                lbHot.isHidden = true
                
                btPrice.backgroundColor = .clear
                btPrice.setTitleColor(UIColor.init(hex: "#33BF71"), for: .normal)
            }
        }
    }
    
    @IBAction func actionBuy(_ sender: UIButton) {
        switch sender {
        case btPrice:
            return
        default:
            return
        }
    }
    var itemBuyRToken: buyRTokenType? {
        didSet{
            
        }
    }


}
