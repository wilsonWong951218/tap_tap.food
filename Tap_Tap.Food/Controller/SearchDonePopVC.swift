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
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UITextView!
    
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starRanking: CosmosView!
    
    @IBOutlet weak var distanceImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var minImage: UIImageView!
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var test: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
        setUpFunc()
        // Do any additional setup after loading the view.
    }

    fileprivate func viewSetUp() {
        popUpView.layer.borderWidth = 1.5
        popUpView.layer.borderColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1).cgColor
        popUpView.layer.cornerRadius = 6.5
        popUpView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.42).cgColor
        popUpView.layer.shadowOpacity = 0.8
        popUpView.layer.shadowRadius = 20
        
        closeButton.backgroundColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1)
        closeButton.layer.cornerRadius = 22
        closeButton.setTitle("Close", for: .normal)
        closeButton.tintColor = UIColor.white
        
        
        let dictionaryShopNameTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 17, FontKern: 0, Color: UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1), Aligment: "center")
        shopNameLabel.attributedText = NSAttributedString(string: "McDonald's", attributes: dictionaryShopNameTextView)
        
        let dictionaryAddressTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 11, FontKern: 0, Color: UIColor(red: 247/255, green: 146/255, blue: 30/255, alpha: 1), Aligment: "center")
        addressLabel.isEditable = false
        addressLabel.attributedText = NSAttributedString(string: "100台北市中正區濟南路二段66號", attributes: dictionaryAddressTextView)
        
        
        let dictionaryReviewTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 11, FontKern: 0, Color: UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), Aligment: "center")
        reviewLabel.attributedText = NSAttributedString(string: "783 Reviews", attributes: dictionaryReviewTextView)
        
         let dictionaryDistanceAndMinTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 12, FontKern: 0, Color: UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), Aligment: "left")
        distanceLabel.attributedText = NSAttributedString(string: "780m", attributes: dictionaryDistanceAndMinTextView)
        minLabel.attributedText = NSAttributedString(string: "6min", attributes: dictionaryDistanceAndMinTextView)
    }
    
    fileprivate func setUpFunc() {
        closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
