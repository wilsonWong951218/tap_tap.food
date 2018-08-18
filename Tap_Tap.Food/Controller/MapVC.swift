//
//  MapVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/16.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import GoogleMaps
class MapVC: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
     let locationManager = CLLocationManager()
    private let searchRadius: Double = 1000
    private let dataProvider = GetGoogleData()
    var searchedTypes = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationNow()
        
        NotificationCenter.default.addObserver(self, selector: #selector(locationChange), name: NSNotification.Name(rawValue: "LocationChange"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(locationChange), name: NSNotification.Name(rawValue: "UpdateLocation"), object: nil)

        mapView.delegate = self        // Do any additional setup after loading the view.
    }

    private func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {
        
        mapView.clear()
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:searchRadius, types: searchedTypes) { places in
//            if places.count > 0 {
//                let randomIndex = Int(arc4random_uniform(UInt32(places.count)))
//                let marker = PlaceMarker(place: places[randomIndex])
//                marker.map = self.mapView
//            }
                  places.forEach {
            
                    let marker = PlaceMarker(place: $0)
                    marker.map = self.mapView
                  }
        }
    }
    
    fileprivate func locationNow(){
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        guard let location = locationManager.location else {return}
        fetchNearbyPlaces(coordinate: location.coordinate)
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
    
    @objc fileprivate func locationChange(){
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    @objc fileprivate func locationUpdate(_ notification: NSNotification){
        if let location = notification.userInfo!["location"] as? CLLocation{
            fetchNearbyPlaces(coordinate: location.coordinate)
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
}



extension MapVC:GMSMapViewDelegate{
    
}
