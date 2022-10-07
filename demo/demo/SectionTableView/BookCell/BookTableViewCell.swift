//
//  BookTableViewCell.swift
//  demo
//
//  Created by bùi thành công on 13/07/2022.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var btRead: UIButton!
    @IBOutlet weak var lbPreview: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbNameBook: UILabel!
    @IBOutlet weak var ivBook: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Corner(view: [btRead], corner: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func actionRead(_ sender: Any) {
    }
    var itemA: Book?{
        didSet{
            ivBook.image = UIImage(named: itemA?.img ?? "")
            lbNameBook.text = itemA?.nameBook
            lbAuthor.text = itemA?.author
            lbPreview.text = itemA?.preview
        }
    }
    
}
