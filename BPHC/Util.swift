//
//  Util.swift
//  BPHC
//
//  Created by Connor Gilheany on 4/14/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import Foundation

class Util{
    
    static let DEBUG = false
    
    static func formattedTimeNow() -> String{
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        return timestamp
    }

    
}
extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}


