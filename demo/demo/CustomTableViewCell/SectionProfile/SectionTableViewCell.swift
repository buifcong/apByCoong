//
//  SectionTableViewCell.swift
//  demo
//
//  Created by bùi thành công on 13/07/2022.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    @IBOutlet weak var tableViewProfile: UITableView!
    var arrProfileInCell: [profile] = []
    var arrBook: [Book] = []
    
    @IBOutlet weak var lbBig: UILabel!
    @IBOutlet weak var lbSmall: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileTableView()
        bindDataInCell()
    }
    func setupProfileTableView(){
        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableViewProfile.register(nib, forCellReuseIdentifier: "BookTableViewCell")
        
        
    }
    func bindDataInCell(){
        let b1 = Book(img: "ic1", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        let b2 = Book(img: "ic2", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        let b3 = Book(img: "ic3", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        let b4 = Book(img: "ic4", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        arrBook.append(b1)
        arrBook.append(b2)
        arrBook.append(b3)
        arrBook.append(b4)
        tableViewProfile.reloadData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    var item4: sectionProfile? {
        didSet{
            lbBig.text = item4?.tittleBig
            lbSmall.text = item4?.titleSmall
        }
    }
    
}
extension SectionTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as! BookTableViewCell
        let item = arrBook[indexPath.row]
        cell.itemA = item
        return cell
    }
    
    
}
