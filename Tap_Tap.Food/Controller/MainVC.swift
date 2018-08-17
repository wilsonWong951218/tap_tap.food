//
//  ViewController.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/14.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import SideMenu

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSideMenu()
        
    }

    fileprivate func setUpSideMenu(){
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController

        
        //三种不同的SideManu的显示.menuSlideIn, .viewSlideInOut, .menuDissolveIn
         SideMenuManager.default.menuPresentMode = .menuSlideIn
        
        //背后荧幕缩放1为初始值
        SideMenuManager.default.menuAnimationTransformScaleFactor = CGFloat(0.95)
        
        SideMenuManager.default.menuWidth = view.frame.width * CGFloat(0.7)
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuBlurEffectStyle = .light
        SideMenuManager.default.menuAnimationFadeStrength = CGFloat(0.3)
        SideMenuManager.default.menuShadowOpacity = Float(0.5)
        
       
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
