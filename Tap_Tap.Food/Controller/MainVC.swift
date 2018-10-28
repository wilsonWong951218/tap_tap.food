//
//  ViewController.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/14.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import SideMenu
import Lottie
import GoogleMaps

class MainVC: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var animationView: UIView!
    var animationArray = [LOTAnimationView]()
    let animationViewTapped = LOTAnimationView(name: "tapped")
//    let animationViewTapped_2 = LOTAnimationView(name: "home")

    var animationViewLoop = LOTAnimationView()
    var timer:Timer? = nil
    private let locationManager = CLLocationManager()
    private let dataProvider = GetGoogleData()
    private var searchRadius: Double = 250
    private var restaurantAfterFilter:DataStore? = nil
    var searchedTypes = ["restaurant"]
//    var searchedTypes = ["supermarket"]
    @IBOutlet weak var buttonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notify = Notification.Name("initAnimate")
        
        NotificationCenter.default.addObserver(self , selector: #selector(setUpAnimation), name: notify, object: nil)

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        setUpSideMenu()
        setUpAnimation()
        
        buttonView.addTarget(self, action: #selector(tappedButton), for: .allTouchEvents)
        
        locationNow()
        
        notificationAddObserver()
        }
    
    func closeButtonReset() {
        animationViewLoop.isHidden = false
        animationViewLoop.frame = CGRect(x: 0, y: 0, width: self.animationView.frame.size.width, height: self.animationView.frame.size.height)
        animationViewLoop.contentMode = .scaleAspectFill
        animationViewLoop.loopAnimation = true
        self.animationView.addSubview(animationViewLoop)
        animationViewLoop.play()
    }
    
    fileprivate func setUpSideMenu(){
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        
        
        //三种不同的SideManu的显示.menuSlideIn, .viewSlideInOut, .menuDissolveIn
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        
        //背后荧幕缩放1为初始值
        SideMenuManager.default.menuAnimationTransformScaleFactor = CGFloat(1)
        SideMenuManager.default.menuWidth = view.frame.width * CGFloat(0.8)
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuBlurEffectStyle = .none
        SideMenuManager.default.menuAnimationFadeStrength = CGFloat(0)
        SideMenuManager.default.menuShadowOpacity = Float(0)
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor(red: 252/255, green: 138/255, blue: 77/255, alpha: 1)
        
    }
    
    @objc private func setUpAnimation() {
        animationViewLoop = LOTAnimationView(name: "tap")// String(arc4random_uniform(2)))
        
        animationViewLoop.frame = CGRect(x: 0, y: 0, width: self.animationView.frame.size.width, height: self.animationView.frame.size.height)
        animationViewLoop.contentMode = .scaleAspectFill
        animationViewLoop.loopAnimation = true
        self.animationView.addSubview(animationViewLoop)
        animationViewLoop.play()
    }
    
    fileprivate func locationNow(){
        locationManager.startUpdatingLocation()
        guard let location = locationManager.location else {return}
        fetchNearbyPlaces(coordinate: location.coordinate)
        locationManager.stopUpdatingLocation()
    }
    
    func notificationAddObserver(){
    NotificationCenter.default.addObserver(self, selector: #selector(locationChange), name: NSNotification.Name(rawValue: "LocationChange"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(locationChange), name: NSNotification.Name(rawValue: "UpdateLocation"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(setRadius(_:)), name: NSNotification.Name(rawValue: "UpdateRadius"), object: nil)
    }
    
    func setUpTappedAnimation() {
        animationViewLoop.stop()
        animationViewLoop.isHidden = true
        animationViewTapped.frame = CGRect(x: 0, y: 0, width: self.animationView.frame.size.width, height: self.animationView.frame.size.height)
        animationViewTapped.contentMode = .scaleAspectFill
        animationViewTapped.loopAnimation = true
        self.animationView.addSubview(animationViewTapped)
        animationViewTapped.play()
    }
    
    @objc fileprivate func tappedButton(_ sender: UIButton) {
        print(sender.tag)
        buttonView.isHidden = true
        locationNow()
        setUpTappedAnimation()
        timer = Timer.scheduledTimer(timeInterval: 5,target:self,selector:#selector(handleTimer),userInfo:nil,repeats:false)
        animationViewTapped.play()
    }
    
    @objc fileprivate func handleTimer() {
        animationViewTapped.stop()
        buttonView.isHidden = false
        
        performSegue(withIdentifier: "toSearchDonePop", sender: nil)
    }
    @objc func notifyGet(noti: Notification) {
        
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor(red: 253/255, green: 102/255, blue: 78/255, alpha: 1)]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSearchDonePop"{
            let passData = segue.destination as! SearchDonePopVC
            passData.restaurantAfterFilter = restaurantAfterFilter
        }
    }
    
    @objc func setRadius(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let id = dict["radius"] as? String{
                searchRadius = Double(id)!
                print(searchRadius)
            }
        }
    }
}


extension MainVC: UISideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }
    
    func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }
    
    func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }
    
    func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
    
}

extension MainVC{
  
    private func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D){
        print("radius:",searchRadius)
        var distanceWalk:String? = nil
        var timeWalk:String? = nil
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:searchRadius, types: searchedTypes) { places in
            if places.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(places.count)))
                let restaurantName = places[randomIndex].name
                let address = places[randomIndex].address
                let rating = places[randomIndex].rating
                let isOpen = places[randomIndex].isOpen
                let coordinateEnd = places[randomIndex].coordinate
                self.dataProvider.fetchDistanceCoordinate(coordinate, coordinateEnd){ distanceRange in
                    distanceWalk = distanceRange?.distance_walk
                    timeWalk = distanceRange?.time_walk
                    if let distance = distanceWalk,let time = timeWalk,let photo = places[randomIndex].photoReference{
                        self.dataProvider.fetchPhotoFromReference(photo){ photo in
                            self.restaurantAfterFilter  = DataStore(name: restaurantName, address: address, rating: rating, isOpen: isOpen, distanceWalk: distance, timeWalk: time, photo: photo)
                        }
                    }
                }
            }
        }
    }

    
    
    
    @objc fileprivate func locationChange(){
        locationManager.startUpdatingLocation()
    }
    
    @objc fileprivate func locationUpdate(_ notification: NSNotification){
        if let location = notification.userInfo!["location"] as? CLLocation{
            fetchNearbyPlaces(coordinate: location.coordinate)
            locationManager.stopUpdatingLocation()
        }
    }
    
}

extension Dictionary{
    static func toNSAttributedStringKey(FontType:String,FontSiza:CGFloat,FontKern:Float,Color:UIColor,Aligment:String) -> [NSAttributedStringKey:Any] {
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        switch Aligment {
        case "center":
            paragraphStyle.alignment = NSTextAlignment.center
        case "right":
            paragraphStyle.alignment = NSTextAlignment.right
        case "left":
            paragraphStyle.alignment = NSTextAlignment.left
        default:
            paragraphStyle.alignment = NSTextAlignment.left
        }
        
        let attributedStringKey = [NSAttributedStringKey.font:UIFont(name: FontType, size: FontSiza)!,NSAttributedStringKey.foregroundColor:Color,NSAttributedStringKey.paragraphStyle:paragraphStyle,NSAttributedStringKey.kern:FontKern] as [NSAttributedStringKey : Any]
        
        return attributedStringKey
    }
}

