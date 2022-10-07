//
//  ReadingBookTableViewCell.swift
//  Reavol_copy
//
//  Created by bùi thành công on 13/08/2022.
//

import UIKit

class ReadingBookTableViewCell: UITableViewCell {

    @IBOutlet weak var btnPushViewReadingBook: UIButton!
    var handlePushView:(() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case btnPushViewReadingBook:
            handlePushView?()
        default:
            return
        }
    }
}
