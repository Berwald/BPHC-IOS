//
//  QuestionTableViewController.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/10/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit
import Firebase

class QuestionTableViewController: UITableViewController {
    
    //MARK: Properties
    var questions = [Question]()
    var selectedIndex = 0
    
    
    // Create a reference to a Firebase location
    var ref = Firebase(url:"https://fiery-heat-2834.firebaseio.com")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Write data to Firebase
        ref.setValue("Test")
        // Read data and react to changes
        ref.observeEventType(.Value, withBlock: {
            snapshot in
            print("\(snapshot.key) -> \(snapshot.value)")
        })
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadExampleQuestion()
    }
    
    
    func loadExampleQuestion(){
        questions += [Question(question: "Does this work?", type: .STD, answer: "Yes!")]
        questions += [Question(question: "Hey how are you", type: .Pregnancy, answer: " ")]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questions.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("question", forIndexPath: indexPath) as! QuestionTableViewCell
        
        let question = questions[indexPath.row]
        
        cell.iconImage.image = UIImage(named: question.type.rawValue)
        cell.questionText.text = question.question
        // Configure the cell...
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowQuestion"{
            let questionView = segue.destinationViewController as! SelectQuestionViewController
            questionView.setQuestionText(questionText: questions[selectedIndex].question)
            questionView.setAnswerText(answerText: questions[selectedIndex].answer!)
        }
        else if segue.identifier == "ComposeQuestion"{
            
        }
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        selectedIndex = indexPath.row
    }
    
    @IBAction func unwindToQuestionList(sender: UIStoryboardSegue) {
        
        let questionController = sender.sourceViewController as! QuestionAskViewController
        let questionText = questionController.questionText.text
        
        let question = Question(question: questionText, type: .STD, answer: " ")
        
        let newIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        questions.insert(question, atIndex: 0)
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Top)
        
    }
    
    @IBAction func unwindToQuestionListCANCEL(sender: UIStoryboardSegue){
        
    }
}
