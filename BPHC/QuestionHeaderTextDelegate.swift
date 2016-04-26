//
//  QuestionHeaderTextDelegate.swift
//  Hudd3L
//
//  Created by Sarah Ferry on 4/24/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class QuestionHeaderTextDelegate: NSObject, UITextViewDelegate {
    
    let MAX_LENGTH = 100
    
    func textViewDidChange(textView: UITextView) {
        let count = textView.text.characters.count
        let text = textView.text
        if(count > MAX_LENGTH){
            let range = text.startIndex..<text.startIndex.advancedBy(MAX_LENGTH)
            textView.text = text.substringWithRange(range)
        }
    }
    
    //MARK: - Placeholder Text
    var placeHolderText = "\n\nEnter Header..."
    
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        textView.textColor = UIColor.blackColor()
        
        if(textView.text == placeHolderText) {
            textView.text = ""
        }
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView.text == "") {
            textView.text = placeHolderText
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    func viewWillAppear(header: UITextView) {
        
        
        if(header.text == "") {
            header.text = placeHolderText
            header.textColor = UIColor.lightGrayColor()
        } else {
            //self.answer.text = answerText
            header.textColor = UIColor.blackColor()
        }
    }

    
    
}
