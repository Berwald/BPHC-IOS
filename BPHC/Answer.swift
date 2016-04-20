//
//  Answer.swift
//  BPHC
//
//  Created by Connor Gilheany on 4/13/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import Foundation

class Answer{
    
    var answer: String
    var formattedTime: String
    var verifiedUser: Bool
    
    init(answer: String, formattedTime: String, verifiedUser: Bool){
        self.answer = answer
        self.formattedTime = formattedTime
        self.verifiedUser = verifiedUser
    }
    
    func toMap() -> Dictionary<String, String>{
        return ["answer" : answer, "formattedDate" : formattedTime]
    }
}