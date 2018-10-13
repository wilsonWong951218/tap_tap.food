//
//  matrixDataStore.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/13.
//  Copyright © 2018年 LAT. All rights reserved.
//

import Foundation
import SwiftyJSON


class matrixDataStore{
    var time_walk:String
    var distance_walk:String
    
    init(dictionary: [String:Any]){
        let json = JSON(dictionary)
        self.time_walk = json["duration"]["text"].stringValue
        self.distance_walk = json["distance"]["text"].stringValue
    }
}
