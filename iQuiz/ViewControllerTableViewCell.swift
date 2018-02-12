//
//  ViewControllerTableViewCell.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/11/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit


class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
