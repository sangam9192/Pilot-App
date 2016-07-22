//
//  Util.swift
//  Pilot App
//
//  Created by Sangam KS on 06/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import Foundation

enum Util{

    static func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }

    static func isValidPassword(password:String) -> Bool {
        let passwordRegex = "\\w{6,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluateWithObject(password)
    }

}
