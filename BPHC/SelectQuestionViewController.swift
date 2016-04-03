//
//  SelectQuestionViewController.swift
//  BPHC
//
//  Created by Connor Gilheany on 3/15/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class SelectQuestionViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var answer: UITextView!
    var questionText = ""
    var answerText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        question.text = questionText
        answer.text = answerText
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuestionText(questionText q: String){
        self.questionText = q
    }
    
    func setAnswerText(answerText a: String){
        self.answerText = a
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
