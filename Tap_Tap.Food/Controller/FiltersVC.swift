//
//  FiltersVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/6.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
class FiltersVC: UIViewController {
    
    @IBOutlet weak var fliterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 254/255, green: 138/255, blue: 77/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        if parent == nil {
            let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor(red: 253/255, green: 102/255, blue: 78/255, alpha: 1)]
            self.navigationController?.navigationBar.titleTextAttributes = textAttributes
            
        }
    }
}
