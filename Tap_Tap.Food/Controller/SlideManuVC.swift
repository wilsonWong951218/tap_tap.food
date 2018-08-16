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
    
    @IBOutlet var tablerView: UITableView!
    let tableViewheaderCellId = "TableHeaderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let nibCell = UINib(nibName: tableViewheaderCellId, bundle: nil)
        tableView.register(nibCell, forHeaderFooterViewReuseIdentifier: tableViewheaderCellId)
        
        guard SideMenuManager.default.menuBlurEffectStyle == nil else {
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewheaderCellId) as! TableHeaderCell
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
}
