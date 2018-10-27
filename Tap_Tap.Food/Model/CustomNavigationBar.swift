//
//  CustomNavigationBar.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/19.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    override func pushItem(_ item: UINavigationItem, animated: Bool) {
        return super.pushItem(item, animated: false)
    }
    
    override func popItem(animated: Bool) -> UINavigationItem? {
        return super.popItem(animated: false)
    }
}
