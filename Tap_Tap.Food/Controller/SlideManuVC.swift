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
    var tableList = ["Tap Tap Tour","Filters","Feedback","Settings","About Us"]
    var tableImage = ["1","2","3","4","5"]
    var nextImage = ["next","next","","next",""]
   
    
    let tableViewheaderCellId = "TableHeaderCell"
    let tableViewCellId = "TableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sildeTableView.register(UINib(nibName: tableViewheaderCellId, bundle: nil), forHeaderFooterViewReuseIdentifier: tableViewheaderCellId)
        sildeTableView.register(UINib(nibName: tableViewCellId, bundle: nil), forCellReuseIdentifier: tableViewCellId)
//        sildeTableView.backgroundColor = UIColor.orange
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
        
        let dictionaryTextView = Dictionary<NSAttributedStringKey, Any>.toNSAttributedStringKey(FontType: "AppleGothic", FontSiza: 16, FontKern: 0, Color: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), Aligment: "left")
        
        cell.lbText.attributedText = NSAttributedString(string: tableList[indexPath.row], attributes: dictionaryTextView)
        cell.iconImage.image = UIImage(named: "\(tableImage[indexPath.row])")
        cell.nextImage.image = UIImage(named: "\(nextImage[indexPath.row])")
        
        //change selected view color
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 253/255, green: 147/255, blue: 85/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            performSegue(withIdentifier: "toSettingPage", sender: nil)
        default:
            break
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewheaderCellId) as! TableHeaderCell
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
