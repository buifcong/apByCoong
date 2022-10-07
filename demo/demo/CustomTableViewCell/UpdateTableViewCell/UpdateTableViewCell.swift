//
//  UpdateTableViewCell.swift
//  demo
//
//  Created by bùi thành công on 13/07/2022.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {

    @IBOutlet weak var btUpdate: UIButton!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbNameBook: UILabel!
    @IBOutlet weak var lbTitleBig: UILabel!
    @IBOutlet weak var lbTitleSmall: UILabel!
    @IBOutlet weak var ivSmall: UIImageView!
    @IBOutlet weak var ivBig: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Corner(view: [ivSmall], corner: ivSmall.frame.height/5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func Action(_ sender: UIButton) {
        switch sender {
        case btUpdate:
            break
        default:
            return
        }
    }
    var item3: updateType?{
        didSet{
            lbNameBook.text = item3?.titleNameBook
            lbAuthor.text = item3?.titleAuthor
        }
    }
}
