//
//  SelectQuestionViewController.swift
//  BPHC
//
//  Created by Connor Gilheany on 3/15/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit
import Firebase

class SelectQuestionViewController: UIViewController, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate{
    
    
    //MARK: Properties
    
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var answer: UITextView!
    @IBOutlet weak var answerTable: UITableView!
    
    var questionObj: Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = questionObj.question
        self.title = questionObj.header
        // Do any additional setup after loading the view.
        answer.delegate = self
        answerTable.dataSource = self
        answerTable.delegate = self
        

        //self.answerTable.rowHeight = UITableViewAutomaticDimension;
        // self.answerTable.estimatedRowHeight = 10.0; // set to whatever your "average" cell height is
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        question.setContentOffset(CGPointZero, animated: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuestion(question: Question){
        self.questionObj = question
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - Actions
    
    @IBAction func onSubmit(sender: UIButton) {
        if(isValidAnswer(self.answer.text)){
            let ref = Firebase(url:"https://fiery-heat-2834.firebaseio.com/\(questionObj!.id)/answers")
            let answerObj = Answer(answer: answer.text, formattedTime: Util.formattedTimeNow(), verifiedUser: UserManager.isLoggedIn())
            ref.childByAutoId().setValue(answerObj.toMap())
            
            questionObj.answers += [answerObj]
            
            answerTable.reloadData()
        }
        self.answer.text = placeHolderText
        self.answer.textColor = UIColor.lightGrayColor()
        self.answer.editable = false
        self.answer.editable = true
    }
    
    func isValidAnswer(text: String) -> Bool{
        return text.trim() != "" && text != placeHolderText
    }
    
    // MARK: - Table Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionObj.answers.count
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        let answer = questionObj.answers[indexPath.row]
        return getHeightForChars(Int(answer.answer.characters.count))
    }
    
    func getHeightForChars(numChars: Int) -> CGFloat{
        return 80 + CGFloat(Double(numChars) * 0.56)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnswerCell", forIndexPath: indexPath) as! AnswerTableViewCell
        let answer = questionObj.answers[indexPath.row]
        
        cell.answer.text = answer.answer
        cell.time.text = answer.formattedTime
        cell.userImage.image = UIImage(named: "hudd3lPenguin")
        
        cell.resize()
        /* cell.iconImage.image = UIImage(named: question.answers.isEmpty ? "unanswered":"answered")
        cell.questionText.text = question.header
        cell.timeAsked.text = question.formattedTime
        cell.setNumberOfAnswers(question.answers.count)*/
        // Configure the cell...
        
        return cell
    }
    
    
    
    // MARK: - Placeholder Text
    var placeHolderText = "\n\nAnswer here..."
    
    
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        self.answer.textColor = UIColor.blackColor()
        
        if(self.answer.text == placeHolderText) {
            self.answer.text = ""
        }
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView.text == "") {
            self.answer.text = placeHolderText
            self.answer.textColor = UIColor.lightGrayColor()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        answer.userInteractionEnabled = UserManager.isLoggedIn() || Util.DEBUG

        if(answer.text == "") {
            self.answer.text = placeHolderText
            self.answer.textColor = UIColor.lightGrayColor()
        } else {
            //self.answer.text = answerText
            self.answer.textColor = UIColor.blackColor()
        }
    }
    
}
