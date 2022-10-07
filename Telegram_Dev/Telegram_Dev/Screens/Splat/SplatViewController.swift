//
//  SplatViewController.swift
//  Telegram_Dev
//
//  Created by bùi thành công on 02/09/2022.
//

import UIKit

class SplatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gotoTabbar()
    }
    
    private func gotoTabbar(){
        let vc = TabbarController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }

}
