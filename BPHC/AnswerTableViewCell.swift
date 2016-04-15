//
//  AnswerTableViewCell.swift
//  BPHC
//
//  Created by Connor Gilheany on 4/14/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var answer: UITextView!
    @IBOutlet weak var time: UITextView!
    
    func resize(){
        answer.scrollEnabled = false
        answer.sizeToFit()
    }
    
    
}
