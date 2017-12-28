//
//  HomeViewController.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/26.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: ParentVC
{
    lazy var list: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: KSCRW, height: 1), style: .plain)
    
    lazy var dataS: DataSource = DataSource(identifier: "HomeCellIDE")
    lazy var deleg: Delegate = Delegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = KAppleGrayColor
        self.navigationItem.title = "Home"
        
        // Do any additional setup after loading the view.
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func load(){
        
        list.backgroundColor = self.view.backgroundColor
        self.view.addSubview(list)
        list.separatorStyle = UITableViewCellSeparatorStyle.none
        list.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        self.dataS = DataSource(identifier: "HomeCellIDE")
        list.dataSource = dataS
        dataS.dataArr = ["扫描银行卡数字"]
            
        list.delegate = deleg
        deleg.didSelectRowAtIndexPath { [unowned self]idx in
            self.list.deselectRow(at: idx, animated: true)
            if  idx.section == 0{
                let scanCard: ScanBankCardNumVC = ScanBankCardNumVC()
                scanCard.navigationItem.title = self.dataS.dataArr[0]
                self.navigationController?.pushViewController(scanCard, animated: true)
            }
        }
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
