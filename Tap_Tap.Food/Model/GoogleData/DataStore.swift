//
//  DataAfterFilter.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/12.
//  Copyright © 2018年 LAT. All rights reserved.
//

import Foundation
import UIKit

class DataStore{
    var name:String
    var address:String
    var rating:Double
    var isOpen:Bool
    var photo: UIImage?
    var distanceWalk:String
    var timeWalk:String

    init(name:String,address:String,rating:Double,isOpen:Bool,distanceWalk:String,timeWalk:String,photo:UIImage?){
        self.name = name
        self.address = address
        self.rating = rating
        self.isOpen = isOpen
        self.distanceWalk = distanceWalk
        self.timeWalk = timeWalk
        self.photo = photo
    }
    
}
