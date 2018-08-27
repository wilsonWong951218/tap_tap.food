//
//  TableViewCell.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/16.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbText: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
