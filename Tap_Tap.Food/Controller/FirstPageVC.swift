//
//  FirstPageVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/9/9.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit

class FirstPageVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpUIFunc()
    }
    
    fileprivate func setUpUI() {
        //StartButton
        startButton.layer.cornerRadius = 35
        let attributedKey = NSAttributedString(string: "Start the Tour", attributes: [NSAttributedStringKey.font:UIFont(name:"AppleGothic", size:25.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        startButton.setAttributedTitle(attributedKey, for: .normal)
    }
    
    fileprivate func setUpUIFunc() {
        startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleStartButton() {
        performSegue(withIdentifier: "toMainPage", sender: nil)
    }
}
