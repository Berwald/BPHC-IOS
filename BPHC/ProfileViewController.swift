//
//  ProfileViewController.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/4/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: Properties
    var user: User?
    @IBOutlet weak var usernameText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func unwindToProfile(sender: UIStoryboardSegue) {
//        print("unwinded to profile")
//        let sourceVC = sender.sourceViewController as! ProfileLoginViewController
//        user = sourceVC.user
//        usernameText.text = user?.username
        if let sourceViewController = sender.sourceViewController as? ProfileLoginViewController, user = sourceViewController.user{
            print("setting username text")
            usernameText.text = user.username
            
        }
    }
    
    @IBAction func unindToProfileCANCEL(sender: UIStoryboardSegue){
        
    }
    
    

}
