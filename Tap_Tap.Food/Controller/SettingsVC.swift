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
    @IBAction func backButton(_ sender: UIButton) {
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTable.register(UINib(nibName:tableViewCellId, bundle: nil), forCellReuseIdentifier:tableViewCellId)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.white
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
