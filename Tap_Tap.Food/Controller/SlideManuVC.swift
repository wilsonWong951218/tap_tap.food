//
//  SlideManuVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/15.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import SideMenu

class SlideManuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard SideMenuManager.default.menuBlurEffectStyle == nil else {
            return
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
