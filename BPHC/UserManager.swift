//
//  UserManager.swift
//  BPHC
//
//  Created by Connor Gilheany on 4/12/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import Foundation

class UserManager {
    
    static var user: User?
    
    static func isLoggedIn() -> Bool{
        return user != nil
    }
    
    
    
    
}