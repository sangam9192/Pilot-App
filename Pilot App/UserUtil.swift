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
    static var userName:String = ""
    
    static func createNewUser(username:String, password:String){
        NSUserDefaults.standardUserDefaults().setValue(username, forKey: "username")
        userName = username
        keychain.set(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
        
    static func checkCredentials(username username:String, password:String)->Bool{
        return password == keychain.get("password") &&
            username == NSUserDefaults.standardUserDefaults().valueForKey("username") as? String ? true : false
    }
    
    static func isUserLoggedIn()->Bool{
        sleep(2)
        return NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
    }
    
    static func logout(){
        NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        keychain.delete("password")
    }
    
}
