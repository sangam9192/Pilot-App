//
//  UserUtil.swift
//  Pilot App
//
//  Created by Sangam KS on 06/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

struct UserUtil{

    static let keychain = KeychainSwift()
    static var username:String = ""
    
    static func createNewUser(userName:String, password:String){
        username = userName
        NSUserDefaults.standardUserDefaults().setValue(username, forKey: Constants.USERNAME)
        keychain.set(password, forKey: Constants.PASSWORD)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
        
    static func checkCredentials(username username:String, password:String)->Bool{
        return password == keychain.get(Constants.PASSWORD) &&
            username == NSUserDefaults.standardUserDefaults().valueForKey(Constants.USERNAME) as? String
    }
    
    static func isUserLoggedIn()->Bool{
        sleep(1)
        if let userName = NSUserDefaults.standardUserDefaults().valueForKey(Constants.USERNAME) as? String{
            UserUtil.username = userName
            return true
        }
        return false
    }
    
    static func logout(){
        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.USERNAME)
        keychain.delete(Constants.PASSWORD)
    }
    
}
