//
//  TopTitleTableViewCell.swift
//  Reavol_copy
//
//  Created by bùi thành công on 13/08/2022.
//

import UIKit

class TopTitleTableViewCell: UITableViewCell {

    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var btnNotify: UIButton!
    @IBOutlet weak var btnLock: UIButton!
    @IBOutlet weak var lbCurrentDate: UILabel!
    var handleLock:(() -> Void)?
    var handleNotify:(() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
         
        lbCurrentDate.text = dateFormatter.string(from: currentDate)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case btnLock:
            handleLock?()
        case btnNotify:
            handleNotify?()
        default:
            return
        }
    }
}
