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
    let MAX_LENGTH = 50
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var charCount: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionText.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions

    func textViewDidChange(textView: UITextView) {
        let count = textView.text.characters.count
        let text = textView.text
        
        if(count > MAX_LENGTH){
            let range = text.startIndex..<text.startIndex.advancedBy(MAX_LENGTH)
            textView.text = text.substringWithRange(range)
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
