//
//  ProfileViewController.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/4/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class ProfileLoginViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login View Loaded")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            //If username/password are null, make them ""
            let username = usernameText.text ?? ""
            let password = passwordText.text ?? ""
            if verifyCredentials(username, password: password){
                print("BPHC certified! Username: \(username) Password: \(password)")
                user = User(username: username)
            }else{
                print("User not certified!")
            }
        }
    }
    
    func verifyCredentials(username: String, password: String) -> Bool{
        //TODO: Real implementation of this. Need this information from BPHC
        return username == password
    }
    

}
