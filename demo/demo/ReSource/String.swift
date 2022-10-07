//
//  String.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import Foundation

extension String {
    
    func validateEmail() -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)

    }
}
