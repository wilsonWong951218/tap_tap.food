//
//  SettingTableViewCell.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/2.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var settingTableText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
