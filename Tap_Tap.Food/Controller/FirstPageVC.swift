//
//  FirstPageVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/9/9.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import Lottie

class FirstPageVC: UIViewController {

    @IBOutlet weak var bottomAnimationstack: UIView!
    @IBOutlet weak var bottomAnimationView: UIView!
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonAnimation()
        setUpAnimation()
        setUpUI()
        setUpUIFunc()
    }
    func setUpButtonAnimation() {
        startButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        UIView.animate(withDuration: 1, animations: { () -> Void in

            self.startButton.transform = CGAffineTransform(scaleX: 1,y: 1)
            
        })
    }
    func setUpAnimation() {
        let animationView = LOTAnimationView(name: "homePage")
        let animationViewStack = LOTAnimationView(name: "homePage2")
        animationView.frame = CGRect(x: 0, y: 0, width: self.bottomAnimationView.frame.size.width, height: self.bottomAnimationView.frame.size.height)
        animationView.contentMode = .scaleAspectFill
//        animationView.loopAnimation = true
        bottomAnimationView.addSubview(animationView)
        animationView.play()
        
        
        
        animationViewStack.frame = CGRect(x: 0, y: 0, width: self.bottomAnimationstack.frame.size.width, height: self.bottomAnimationstack.frame.size.height)
        animationViewStack.contentMode = .scaleAspectFill
        //        animationView.loopAnimation = true
        bottomAnimationstack.addSubview(animationViewStack)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        animationViewStack.play()
        }
    }
    fileprivate func setUpUI() {
        //StartButton
        startButton.layer.zPosition = 20
        startButton.layer.cornerRadius = 35
        let attributedKey = NSAttributedString(string: "Start the Tour", attributes: [NSAttributedStringKey.font:UIFont(name:"AppleGothic", size:25.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        startButton.setAttributedTitle(attributedKey, for: .normal)
    }
    
    fileprivate func setUpUIFunc() {
        startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleStartButton() {
        UIView.animate(withDuration: 1, animations: { () -> Void in
            
            self.startButton.transform = CGAffineTransform(scaleX: -1,y: 1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            self.performSegue(withIdentifier: "toMainPage", sender: nil)
            }

        })

    }
}
