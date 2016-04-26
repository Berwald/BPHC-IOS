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
    
    
    var exQuestion = Question(header: "Question Header 1 Question Header 2 Question Header 3 Question Header 4 Question Header 5 Question Header 6 Question Header 7 Question Header 8 Question Header 9 Question Header 10 Question Header 11 Question Header 12 Question Header 13 Question Header 14", question: "Question text", formattedTime: "10 minutes ago idk", answers: [Answer(answer: "This is the answer", formattedTime: "5 minutes ago", verifiedUser: true)], id: "123456789")
    var exQuestion2 = Question(header: "Question Header 1 Question Header 2 Question Header 3 Question Header 4 Question Header 5 Question Header 6 Question Header 7 ", question: "Question text", formattedTime: "10 minutes ago idk", answers: [Answer(answer: "This is the answer", formattedTime: "5 minutes ago", verifiedUser: true)], id: "987654321")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Retrieve new posts as they are added to your database
        loadQuestions()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadQuestions(){
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            
            let header = snapshot.value.objectForKey("question")!.valueForKey("header")! as! String
            let questionText = snapshot.value.objectForKey("question")!.valueForKey("question")! as! String
            let formattedDate = snapshot.value.objectForKey("question")!.valueForKey("formattedDate")! as! String
            let id = String(snapshot.ref).componentsSeparatedByString("/")
            

            let answerKeys = snapshot.value.objectForKey("answers")?.allKeys as? [String]
            var answersArray = [Answer]()
            if let keys = answerKeys{
                for x in keys{
                    let JSONAns = snapshot.value.objectForKey("answers")?.objectForKey(x)
                    let ans = JSONAns?.valueForKey("answer") as! String
                    let formattedTime = JSONAns?.valueForKey("formattedDate") as! String
                    let answer = Answer(answer: ans, formattedTime: formattedTime, verifiedUser: true)
                    answersArray += [answer]
                    //print(x)
                }
            }
            
            
            let question = Question(header: header, question: questionText, formattedTime: formattedDate, answers: answersArray, id: id[id.count-1])
            
            //  let header = snapshot.
            //Question(header: "Question Header", question: snapshot.value.objectForKey("question") as! String, formattedTime: "10 minutes ago idk", answers: [snapshot.value.objectForKey("answer") as? String])
            self.questions.insert(question, atIndex: 0)
            self.reloadTable()
            
        })
        
    }
    
    func parseAnswers(answers: String) -> [Answer]{
        return []
        
    }
    
    func reloadTable(){
        self.tableView.reloadData()
        
        
        
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
        return questions.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("question", forIndexPath: indexPath) as! QuestionTableViewCell
        let question = questions[indexPath.row]
        
        // Configure the cell...
       // cell.iconImage.image = UIImage(named: question.answers.isEmpty ? "unanswered":"answered")
        
        cell.questionText.text = question.header
        cell.questionText.scrollEnabled = false
        cell.questionText.sizeToFit()
        
        cell.timeAsked.text = question.formattedTime
        cell.timeAsked.textColor = UIColor.lightGrayColor()
        
        cell.setNumberOfAnswers(question.answers.count)
        cell.numAnswers.textColor = UIColor.lightGrayColor()
        
        
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let question = questions[indexPath.row]
        return getHeightForChars(question.header.characters.count)
    }
    
    func getHeightForChars(numChars: Int) -> CGFloat{
        return 70 + CGFloat(Double(numChars) * 0.6)
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
        // Get the new view controller using segue.destinationViewController
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowQuestion"{
            let questionView = segue.destinationViewController as! SelectQuestionViewController
            questionView.setQuestion(questions[selectedIndex])
            print("Current selected index variable value: \(selectedIndex)")
        }
        else if segue.identifier == "ComposeQuestion"{
            
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        selectedIndex = indexPath.row
        performSegueWithIdentifier("ShowQuestion", sender: self)
        print("Index Selected: \(indexPath.row)")
    }
    
    @IBAction func unwindToQuestionList(sender: UIStoryboardSegue) {
        
        let qc = sender.sourceViewController as! QuestionAskViewController
        //        let questionText = questionController.questionText.text
        //
        //        let question = Question(question: questionText, type: .STD, answer: " ")
        //
        //        let newIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        //        questions.insert(question, atIndex: 0)
        //        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Top)
        
        // Write questions to Firebase
        //TODO: figure out how to write answers to Firebase
        
        let questionRef = ref.childByAutoId()
        let question1 = ["question": ["question": qc.questionText.text, "header": qc.questionHeader.text, "formattedDate": Util.formattedTimeNow()]]
        questionRef.setValue(question1)
        
    }
    
    @IBAction func unwindToQuestionListCANCEL(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func onRefreshClick(sender: UIBarButtonItem) {
        questions = []
        loadQuestions()
        
    }
    
    //MARK: - Testing
    func getAllCells() -> [UITableViewCell] {
        
        var cells = [UITableViewCell]()
        // assuming tableView is your self.tableView defined somewhere
        print(tableView.numberOfRowsInSection(0))
        for j in 0...tableView.numberOfRowsInSection(0)-1
        {
            if let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: j, inSection: 0)) {
                
                cells.append(cell)
            }
            
        }
        return cells
    }
    
}
