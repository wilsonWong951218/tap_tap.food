//
//  PlaceMarker.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/17.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
    
    let place:GoogleData
    
    init(place:GoogleData) {
        self.place = place
        
        super.init()
        position = place.coordinate
       // icon = UIImage(named: place.placeType+"_pin")
        icon = UIImage(named: "pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
    }
    
}
