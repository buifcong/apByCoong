//
//  PosterCollectionViewCell.swift
//  demo
//
//  Created by bùi thành công on 18/07/2022.
//

import UIKit
import Alamofire
import ObjectMapper
class PosterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionPoster: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionViewPoster()
    }
    func setupCollectionViewPoster(){
//        collectionPoster.delegate = self
//        collectionPoster.dataSource = self
        let nib = UINib(nibName: "InPosterCollectionViewCell", bundle: nil)
        collectionPoster.register(nib, forCellWithReuseIdentifier: "InPosterCollectionViewCell")

    }
    
    var arrPoster:[DataBuyVipRToken] = [] {
        didSet{
            collectionPoster.reloadData()
        }
    }
}
extension PosterCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPoster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InPosterCollectionViewCell", for: indexPath) as! InPosterCollectionViewCell
        let item = arrPoster[indexPath.item]
        cell.item = item
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
