//
//  FiltersVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/6.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import fluid_slider
class FiltersVC: UIViewController {
    

    @IBOutlet weak var slider: Slider!
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 500) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "500"))
        if let lastRadiusValue = UserDefaults.standard.dictionary(forKey: "lastRadiusValue"){
            let result = lastRadiusValue["radius"] as! String
            slider.fraction = CGFloat(Float(result)!/500)
        }else{
            slider.fraction = 0.5
        }
        slider.shadowOffset = CGSize(width: 0, height: 10)
        slider.shadowBlur = 5
        slider.shadowColor = UIColor(white: 0, alpha: 0.1)
        slider.contentViewColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1)
        slider.valueViewColor = .white
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    @objc fileprivate func sliderValueChanged() {
        slider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 500) as NSNumber) ?? ""
            let dataDict:[String:String] = ["radius":string]
            NotificationCenter.default.post(name: NSNotification.Name("UpdateRadius"), object: nil, userInfo: dataDict)
            UserDefaults.standard.set(dataDict, forKey: "lastRadiusValue")
            return NSAttributedString(string: string)
        }
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        if parent == nil {
            let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor(red: 253/255, green: 102/255, blue: 78/255, alpha: 1)]
            self.navigationController?.navigationBar.titleTextAttributes = textAttributes
            
        }
    }
}
