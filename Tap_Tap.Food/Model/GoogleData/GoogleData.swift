//
//  GoogleData.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/17.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import SwiftyJSON

class GoogleData {
    let name:String
    let address: String
    let coordinate: CLLocationCoordinate2D
    var placeType: String
    var photoReference: String?
    var photo: UIImage?
    var rating: Double
    var isOpen: Bool
    
    init(dictionary: [String:Any], acceptedTypes:[String])
    {
        let json = JSON(dictionary)
        name = json["name"].stringValue
        address = json["vicinity"].stringValue
        rating = json["rating"].doubleValue
        isOpen = json["opening_hours"]["open_now"].boolValue
        photoReference = json["photos"][0]["photo_reference"].string
        let latitude = json["geometry"]["location"]["lat"].doubleValue as CLLocationDegrees
        let longitude = json["geometry"]["location"]["lng"].doubleValue as CLLocationDegrees
        coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        var foundType = "restaurant"
        if let types = json["types"].arrayObject as? [String]{
            for type in types{
                if acceptedTypes.contains(type){
                    foundType = type
                    break
                }
            }
        }
        placeType = foundType
    }
}
