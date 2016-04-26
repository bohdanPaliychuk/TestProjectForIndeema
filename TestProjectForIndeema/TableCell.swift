//
//  TableCell.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/26/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import UIKit



class TableCell: UITableViewCell {

    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
   
    var actionHandler: (()->Void)?
    
    
    @IBAction func buttonAction(sender: AnyObject) {
        actionHandler?()
    }
}
