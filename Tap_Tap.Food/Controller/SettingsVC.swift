//
//  SettingsVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/9/15.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let tableViewCellId = "SettingTableViewCell"
    var tableList = ["Contact Us","Notifications","Terns of Service","Privacy"]
    var nextImage = ["next","next","next","next","next"]
    @IBOutlet weak var settingTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        settingTable.register(UINib(nibName:tableViewCellId, bundle: nil), forCellReuseIdentifier:tableViewCellId)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
       
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! SettingTableViewCell
        let dictionaryTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 16, FontKern: 0, Color: UIColor.black, Aligment: "left")
        cell.settingTableText.attributedText = NSAttributedString(string: tableList[indexPath.row], attributes: dictionaryTextView)
        cell.imageIcon.image = UIImage(named: "\(tableList[indexPath.row])")
        //cell.nextImage.image = UIImage(named: "\(nextImage[indexPath.row])")
        //change selected view color
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 253/255, green: 147/255, blue: 85/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        return cell
    }
  
}
