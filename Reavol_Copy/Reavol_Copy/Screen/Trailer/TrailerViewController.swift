//
//  TrailerViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 24/07/2022.
//

import UIKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFreeEperience: UIButton!
    @IBOutlet weak var paging: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
        configCollectioonView()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    func designUI(){
        btnFreeEperience.layer.cornerRadius = btnFreeEperience.frame.height/2
        btnFreeEperience.clipsToBounds = true
    }
    func configCollectioonView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib1 = UINib(nibName: "TrailerCollectionViewCell", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: "TrailerCollectionViewCell")
        let nib2 = UINib(nibName: "Trailer2CollectionViewCell", bundle: nil)
        collectionView.register(nib2, forCellWithReuseIdentifier: "Trailer2CollectionViewCell")
        let nib3 = UINib(nibName: "Trailer3CollectionViewCell", bundle: nil)
        collectionView.register(nib3, forCellWithReuseIdentifier: "Trailer3CollectionViewCell")
    }

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnLogin:
            navigationController?.pushViewController(LoginWithViewController(), animated: true)
            return
        case btnFreeEperience:
            return
        default:
            return
        }
    }
    
}
extension TrailerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trailer2CollectionViewCell", for: indexPath) as! Trailer2CollectionViewCell
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trailer3CollectionViewCell", for: indexPath) as! Trailer3CollectionViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrailerCollectionViewCell", for: indexPath) as! TrailerCollectionViewCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trailer2CollectionViewCell", for: indexPath) as! Trailer2CollectionViewCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.size.height)
    }
    
}
extension TrailerViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.size.width)
        paging.currentPage = Int(pageIndex)
    }
}
