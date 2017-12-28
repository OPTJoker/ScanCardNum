//
//  ParentVC.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/27.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

class ParentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let back:UIBarButtonItem = UIBarButtonItem.init()
        back.title = "";
        self.navigationItem.backBarButtonItem = back;
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
