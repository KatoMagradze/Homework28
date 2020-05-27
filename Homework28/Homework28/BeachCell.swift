//
//  BeachCell.swift
//  Homework28
//
//  Created by Kato on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class BeachCell: UITableViewCell {

    @IBOutlet weak var beachItemImage: UIImageView!
    @IBOutlet weak var beachItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
