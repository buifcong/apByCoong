//
//  PosterTableViewCell.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import UIKit

class PosterTableViewCell: UITableViewCell {

    @IBOutlet weak var lbBig: UILabel!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbSmall: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var item2: poster? {
        didSet{
            lbBig.text = item2?.titleBig
            lbSmall.text = item2?.titleSmall
        }
    }
    
}
