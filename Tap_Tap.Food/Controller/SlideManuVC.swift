//
//  SlideManuVC.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/8/15.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import SideMenu

class SlideManuVC: UITableViewController {
    
    @IBOutlet var sildeTableView: UITableView!
    var tableList = ["About Us","FeedBack","Setting"]
    let tableViewheaderCellId = "TableHeaderCell"
    let tableViewCellId = "TableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sildeTableView.register(UINib(nibName: tableViewheaderCellId, bundle: nil), forHeaderFooterViewReuseIdentifier: tableViewheaderCellId)
        sildeTableView.register(UINib(nibName: tableViewCellId, bundle: nil), forCellReuseIdentifier: tableViewCellId)
        
        guard SideMenuManager.default.menuBlurEffectStyle == nil else {
            return
        }
    }
    
}

extension SlideManuVC{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! TableViewCell
        
        let dictionaryTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "PingFangTC-Regular", FontSiza: 14, FontKern: 1.1, Color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), Aligment: "center")
        
        cell.lbText.attributedText = NSAttributedString(string: tableList[indexPath.row], attributes: dictionaryTextView)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewheaderCellId) as! TableHeaderCell
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
        
}
