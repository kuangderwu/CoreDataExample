//
//  ShowRecordTableViewCell.swift
//  CoreDataExample
//
//  Created by Mac on 2/11/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ShowRecordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var contentLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
