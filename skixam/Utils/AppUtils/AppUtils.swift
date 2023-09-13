//
//  AppUtils.swift
//  skixam
//
//  Created by Usman Ramzan on 11/09/2023.
//

import Foundation

func validateEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: email)
}
