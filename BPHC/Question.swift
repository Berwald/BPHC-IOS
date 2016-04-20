//
//  Question.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/10/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class Question{
    
    var header: String
    var question: String
    var formattedTime: String
    var answers = [Answer]()
    
    init(header: String, question: String, formattedTime: String, answers: [Answer]){
        self.header = header
        self.question = question
        self.formattedTime = formattedTime
        self.answers = answers
    }
    
    func addAnswer(answer: Answer){
        answers += [answer]
    }
    
    func toMap() -> Dictionary<String, String>{
        return ["header" : header, "question" : question, "formattedDate" : formattedTime]
    }
    
    
    
    
}
