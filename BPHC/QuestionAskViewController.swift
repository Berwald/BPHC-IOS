//
//  QuestionAskViewController.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/16/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class QuestionAskViewController: UIViewController, UITextViewDelegate {
    
    //MARK: Properties
    let QUESTION_MAX_LENGTH = 500
    let HEADER_MAX_LENGTH = 100
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var charCount: UITextView!
    @IBOutlet weak var questionHeader: UITextView!
    let headerDelegate = QuestionHeaderTextDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionText.delegate = self
        questionHeader.delegate = headerDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions

    func textViewDidChange(textView: UITextView) {
        let count = textView.text.characters.count
        let text = textView.text
        
        let max = textView.accessibilityLabel == "header" ? HEADER_MAX_LENGTH : QUESTION_MAX_LENGTH
        
        if(count > max){
            let range = text.startIndex..<text.startIndex.advancedBy(max)
            textView.text = text.substringWithRange(range)
        }
    }
    
    //MARK: - Placeholder Text
    var placeHolderText = "\n\nEnter Question..."
    
    
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
    
    override func viewWillAppear(animated: Bool) {
        
        headerDelegate.viewWillAppear(questionHeader)
        
        if(self.questionText.text == "") {
            self.questionText.text = placeHolderText
            self.questionText.textColor = UIColor.lightGrayColor()
        } else {
            //self.answer.text = answerText
            self.questionText.textColor = UIColor.blackColor()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
