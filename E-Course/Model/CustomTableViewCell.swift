//
//  CustomTableViewCell.swift
//  E-Course
//
//  Created by Attapong on 10/30/2557 BE.
//  Copyright (c) 2557 Suparuch Sriploy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var descriptionCell: UILabel!
    @IBOutlet var nameCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
