//
//  MultiCellViewController.swift
//  demo
//
//  Created by bùi thành công on 13/07/2022.
//

import UIKit

class MultiCellViewController: UIViewController {
    var arrProfile: [profile] = []
    var arrPoster: [poster] = []
    var arrUdate: [updateType] = []
    var arrSectionProfile: [sectionProfile] = []
//    var arrBook: [Book] = []

    @IBOutlet weak var multiTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindData2()
        navigationController?.navigationBar.isHidden = true

    }
    func setupTableView(){
        let nib1 = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        multiTableView.register(nib1, forCellReuseIdentifier: "ProfileTableViewCell")
        let nib2 = UINib(nibName: "PosterTableViewCell", bundle: nil)
        multiTableView.register(nib2, forCellReuseIdentifier: "PosterTableViewCell")
        let nib3 = UINib(nibName: "UpdateTableViewCell", bundle: nil)
        multiTableView.register(nib3, forCellReuseIdentifier: "UpdateTableViewCell")
        let nib4 = UINib(nibName: "SectionTableViewCell", bundle: nil)
        multiTableView.register(nib4, forCellReuseIdentifier: "SectionTableViewCell")
        let nib5 = UINib(nibName: "BookTableViewCell", bundle: nil)
        multiTableView.register(nib5, forCellReuseIdentifier: "BookTableViewCell")
    }
    func bindData2(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "vi")
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        let dateString = dateFormatter.string(from: currentDate)


        let profile1 = profile(dateCurrent: "\(dateString)", days: "Hôm nay")
        arrProfile.append(profile1)
        let poster1 = poster(titleBig: "TRẢI NGHIỆM MỚI", titleSmall: "Thử thách đọc sách 30 ngày cùng Reavol ")
        arrPoster.append(poster1)
        let update1 = updateType(titleNameBook: "Chuyến dã ngoại của Lan va Diep", titleAuthor: "Edward B.Burger and Michale Mike")
        arrUdate.append(update1)
        let sectionProfile1 = sectionProfile(titleBig: "SÁCH MIỄN PHÍ", titleSmall: "Sách được tặng")
        arrSectionProfile.append(sectionProfile1)
//        let b1 = Book(img: "ic1", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
//        let b2 = Book(img: "ic2", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
//        let b3 = Book(img: "ic3", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
//        let b4 = Book(img: "ic4", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
//        arrBook.append(b1)
//        arrBook.append(b2)
//        arrBook.append(b3)
//        arrBook.append(b4)
        multiTableView.reloadData()
    }




}
extension MultiCellViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
            let item1 = arrProfile[0]
            cell1.item1 = item1
            Corner(view: [cell1], corner: 10)
            return cell1
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "PosterTableViewCell") as! PosterTableViewCell
            let item = arrPoster[0]
            cell2.item2 = item
            Corner(view: [cell2], corner: 10)
            return cell2
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell") as! UpdateTableViewCell
            let item = arrUdate[0]
            cell3.item3 = item
            Corner(view: [cell3], corner: 10)
            return cell3
        case 3:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "SectionTableViewCell") as! SectionTableViewCell
            let item = arrSectionProfile[0]
            cell4.item4 = item
            return cell4
            
            
            
        default:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell") as! UpdateTableViewCell
            let item = arrUdate[0]
            cell3.item3 = item
            Corner(view: [cell3], corner: 10)
            return cell3
        }
        
    }
    
    
}
