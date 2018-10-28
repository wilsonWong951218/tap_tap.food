//
//  SearchDonePopVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/7.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import Cosmos

class SearchDonePopVC: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UITextView!
    
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starRanking: CosmosView!
    
    @IBOutlet weak var distanceImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var minImage: UIImageView!
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var test: UITextView!
    
    var restaurantAfterFilter:DataStore? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let restaurantData = restaurantAfterFilter{
            viewSetUp(restaurantData)
        }
        setUpFunc()
        // Do any additional setup after loading the view.
    }

    fileprivate func viewSetUp(_ restaurantData:DataStore) {
        
        popUpView.layer.borderWidth = 1.5
        popUpView.layer.borderColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1).cgColor
        popUpView.layer.cornerRadius = 6.5
        popUpView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        popUpView.layer.shadowOpacity = 1
        popUpView.layer.shadowRadius = 20
        
        closeButton.backgroundColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1)
        closeButton.layer.cornerRadius = 22
        closeButton.setTitle("Close", for: .normal)
        closeButton.tintColor = UIColor.white
        
        
        shopImage.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            shopImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        } // Top right corner, Top left corner respectively
        shopImage.image = restaurantData.photo
        
        let dictionaryShopNameTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 17, FontKern: 0, Color: UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1), Aligment: "center")
        shopNameLabel.attributedText = NSAttributedString(string: restaurantData.name , attributes: dictionaryShopNameTextView)
        
        let dictionaryAddressTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 11, FontKern: 0, Color: UIColor(red: 247/255, green: 146/255, blue: 30/255, alpha: 1), Aligment: "center")
        addressLabel.isEditable = false
        addressLabel.attributedText = NSAttributedString(string: restaurantData.address , attributes: dictionaryAddressTextView)
        
        print(restaurantData.rating)
        starRanking.rating = restaurantData.rating
        starRanking.settings.fillMode = .precise
        starRanking.settings.updateOnTouch = false
        
        let dictionaryReviewTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 11, FontKern: 0, Color: UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), Aligment: "center")
        reviewLabel.attributedText = NSAttributedString(string: restaurantData.isOpen ? "Open Now" : "Close Now", attributes: dictionaryReviewTextView)
        
         let dictionaryDistanceAndMinTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 12, FontKern: 0, Color: UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), Aligment: "left")
        distanceLabel.attributedText = NSAttributedString(string: restaurantData.distanceWalk, attributes: dictionaryDistanceAndMinTextView)
        minLabel.attributedText = NSAttributedString(string: restaurantData.timeWalk , attributes: dictionaryDistanceAndMinTextView)
    }
    
    fileprivate func setUpFunc() {
        closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
