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
    var id: String
    
    init(header: String, question: String, formattedTime: String, answers: [Answer], id: String){
        self.header = header
        self.question = question
        self.formattedTime = formattedTime
        self.answers = answers
        self.id = id
    }
    
    func addAnswer(answer: Answer){
        answers += [answer]
    }
    
    
    
    
}
