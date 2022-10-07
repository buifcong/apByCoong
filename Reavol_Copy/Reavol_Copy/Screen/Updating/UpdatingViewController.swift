//
//  UpdatingViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 14/08/2022.
//

import UIKit

class UpdatingViewController: UIViewController {
    
    var handleViewBur:(() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {[weak self] in
            self?.handleViewBur?()
            self?.dismiss(animated: true)
        }
    }
    
}
