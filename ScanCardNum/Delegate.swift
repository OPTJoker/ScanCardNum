//
//  Delegate.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/26.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

//typealias IndexPathCallBack = (_:IndexPath)->()

class Delegate: NSObject, UITableViewDelegate{
    
    private var selectedCallback: ((_: IndexPath)->Void)?
    
    func didSelectRowAtIndexPath(callBack:@escaping (IndexPath)->Void) {
        selectedCallback = callBack
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {        
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let callback = selectedCallback{
            callback(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            DLog(msg: "min FL:\(CGFloat.leastNormalMagnitude)")
            return 30
        default:
            DLog(msg: "min FL:\(CGFloat.leastNormalMagnitude)")
            return CGFloat.leastNormalMagnitude
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    
}
