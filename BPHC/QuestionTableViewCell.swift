//
//  QuestionTableViewCell.swift
//  BPHC
//
//  Created by Connor Gilheany on 2/10/16.
//  Copyright © 2016 Chuanwei Zhou. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var questionText: UITextView!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
