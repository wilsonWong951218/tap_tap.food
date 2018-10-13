//
//  File.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/17.
//  Copyright © 2018年 LAT. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import SwiftyJSON

typealias PlacesCompletion = ([GoogleData]) -> Void
typealias PhotoCompletion = (UIImage?) -> Void
typealias DistanceCompletion = (matrixDataStore?) -> Void

class GetGoogleData{
    private var photoCache: [String: UIImage] = [:]
    private var placesTask: URLSessionDataTask?
    private var session: URLSession {
        return URLSession.shared
    }
    
    func fetchPlacesNearCoordinate(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], completion: @escaping PlacesCompletion) -> Void {
        var urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)&rankby=prominence&sensor=true&language=zh-TW&key=\(googleApiKey)"
        let typesString = types.count > 0 ? types.joined(separator: "|") : "food"
        urlString += "&types=\(typesString)"
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? urlString
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        
        if let task = placesTask, task.taskIdentifier > 0 && task.state == .running {
            task.cancel()
        }
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        placesTask = session.dataTask(with: url) { data, response, error in
            var placesArray: [GoogleData] = []
            defer {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    completion(placesArray)
                }
            }
            guard let data = data,let json = try? JSON(data: data, options: .mutableContainers),let results = json["results"].arrayObject as? [[String: Any]] else {
                return
            }
            print(JSON(results))
            results.forEach {
                let place = GoogleData(dictionary: $0, acceptedTypes: types)
                 placesArray.append(place)
                //做其他api
//                if let reference = place.photoReference {
//                    self.fetchPhotoFromReference(reference) { image in
//                        place.photo = image
//                        print(place.photo)
//                    }
//                }
//
            }
        }
        placesTask?.resume()
    }
    
    
    func fetchPhotoFromReference(_ reference: String, completion: @escaping PhotoCompletion) -> Void {
        if let photo = photoCache[reference] {
            completion(photo)
        } else {
            let urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=\(reference)&key=\(googleApiKey)"
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
            
            session.downloadTask(with: url) { url, response, error in
                var downloadedPhoto: UIImage? = nil
                defer {
                    DispatchQueue.main.async {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        completion(downloadedPhoto)
                    }
                }
                guard let url = url else {
                    return
                }
                guard let imageData = try? Data(contentsOf: url) else {
                    return
                }
                downloadedPhoto = UIImage(data: imageData)
                self.photoCache[reference] = downloadedPhoto
                }
                .resume()
        }
    }
    
    func fetchDistanceCoordinate(_ coordinateStart: CLLocationCoordinate2D, _ coordinateEnd:CLLocationCoordinate2D, completion: @escaping DistanceCompletion) -> Void{
        let urlString = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=\(coordinateStart.latitude),\(coordinateStart.longitude)&&destinations=\(coordinateEnd.latitude),\(coordinateEnd.longitude)&mode=walking&language=zh-TW&key=\(googleApiKey)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        session.dataTask(with: url) { data, response, error in
            var distanceData:matrixDataStore? = nil
            defer {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    completion(distanceData)
                }
            }
         
            guard let data = data,let json = try? JSON(data: data),let results = json["rows"][0]["elements"].arrayObject as? [[String: Any]] else {
                return
            }
           
            distanceData = matrixDataStore(dictionary:results[0])
            
            }
            .resume()
    }
}
