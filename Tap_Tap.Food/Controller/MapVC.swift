//
//  MapVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/16.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import GoogleMaps
class MapVC: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    private let locationManager = CLLocationManager()
    private let searchRadius: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - CLLocationManagerDelegate
extension MapVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        //fetchNearbyPlaces(coordinate: location.coordinate)
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
}

extension MapVC:GMSMapViewDelegate{
    
}
