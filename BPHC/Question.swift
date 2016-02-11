//
//  Question.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/10/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class Question{
    
    var question: String
    var answer: String?
    var type: Type
    
    init(question: String, type: Type, answer: String?){
        self.question = question
        self.answer = answer
        self.type = type
    }
    
    
}

enum Type: String{
    case STD = "questionmark"
    case DrugsAlcohol = "1"
    case Pregnancy = "profile"
    case Mental = "3"
    case Nutrition = "4"
    case Other = "5"
    //TODO: Set up actual pictures
    
}