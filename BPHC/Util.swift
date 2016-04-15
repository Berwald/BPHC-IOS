//
//  Util.swift
//  BPHC
//
//  Created by Connor Gilheany on 4/14/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import Foundation

class Util{
    
    static let DEBUG = true
    
    static func formattedTimeNow() -> String{
        return "time now"//TODO
    }
    
    
}
extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}
