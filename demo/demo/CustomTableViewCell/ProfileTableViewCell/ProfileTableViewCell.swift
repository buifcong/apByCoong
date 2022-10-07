//
//  ProfileTableViewCell.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var lbDateNow: UILabel!
    @IBOutlet weak var lbDays: UILabel!
    @IBOutlet weak var btnLock:UIButton!
    @IBOutlet weak var btnNotification
    :UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actioninView(_ sender: UIButton) {
        switch sender {
        case btnLock:
            break
        case btnNotification:
            break
        default:
            return
        }
    }
    var item1: profile? {
        didSet {
            lbDateNow.text = item1?.dateCurrent
            lbDays.text = item1?.days

        }
    }
    
}
