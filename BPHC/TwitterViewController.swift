//
//  TwitterViewController.swift
//  BPHC
//
//  Created by Sarah Ferry on 2/24/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//
//
import UIKit
import TwitterKit


class TwitterViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    let client = TWTRAPIClient()
    self.dataSource = TWTRUserTimelineDataSource(screenName: "HealthyBoston", APIClient: client)
        
    }

}
