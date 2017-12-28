//
//  DataSource.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/26.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource{
    
    var identifier: String
    var dataArr: Array<String> = [String]()
    
    init(identifier: String) {
        self.identifier = identifier
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = UITableViewCell(style:.default, reuseIdentifier: identifier)
            cell!.layer.cornerRadius = 4
            cell?.layer.masksToBounds = true
            cell!.backgroundColor = .white
            cell!.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            cell!.textLabel?.textColor = KTopicTintColor
            cell!.textLabel?.textAlignment = .center
        }
        cell!.textLabel?.text = dataArr[indexPath.section]
        return cell!
    }
}
