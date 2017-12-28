//
//  ScanBankCardNumVC.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/26.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

let cardW:CGFloat = 400.0
let cardH:CGFloat = 400.0/1.59

class ScanBankCardNumVC: ParentVC, CardIOViewDelegate{
    
    var scanFlag:Bool = false
    
    lazy var cardBorderView: UIView = UIView.init()
    //lazy var scanBtn:UIButton = UIButton.init(type: .custom)
    lazy var textView:UILabel = UILabel.init()
    lazy var cpBtn:UIButton = UIButton.init(type: .custom)
    
    private func load(){
        // 扫描框
        cardBorderView.layer.borderColor = KTopicTintColor.cgColor
        cardBorderView.layer.borderWidth = 2.0
        cardBorderView.layer.cornerRadius = 4
        cardBorderView.layer.masksToBounds = true
        cardBorderView.backgroundColor = .lightGray
        self.view.addSubview(cardBorderView)
        cardBorderView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaInsets.top).offset(8)
            } else {
                make.top.equalTo(self.view).offset(8)
            }
            make.left.equalTo(self.view).offset(8)
            make.right.equalTo(self.view).offset(-8)
            make.height.equalTo(CGFloat(KSCRW/1.59))
        }
        
        
        // text
        textView.textColor = KTopicTintColor
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.layer.cornerRadius = 4
        textView.layer.masksToBounds = true
        self.view.addSubview(textView)
        textView.backgroundColor = .white
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(self.cardBorderView.snp.bottom).offset(16)
            make.left.equalTo(self.view).offset(8)
            make.right.equalTo(self.view).offset(-16-90)
            make.height.equalTo(46)
        }
        
        // copy button
        // scan btn
        cpBtn.setTitle("复 制", for: .normal)
        cpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cpBtn.setTitleColor(KTopicTintColor, for: .normal)
        cpBtn.backgroundColor = .white
        cpBtn.layer.cornerRadius = 4
        cpBtn.addTarget(self, action: #selector(copyText), for: .touchUpInside)
        cpBtn.showsTouchWhenHighlighted = true
        self.view.addSubview(cpBtn)
        
        cpBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(textView)
            make.right.equalTo(self.view).offset(-8)
            make.height.equalTo(40)
            make.width.equalTo(90)
        }
    }
    
    func cardIOView(_ cardIOView: CardIOView!, didScanCard cardInfo: CardIOCreditCardInfo!) {
        if (cardInfo != nil) {
            // The full card number is available as info.cardNumber, but don't log that!
            DLog(msg: cardInfo.cardNumber)
            self.textView.text = "  "+String(cardInfo.cardNumber)
            scanFlag = false
            self.startScanVC()
            
        }else {
            DLog(msg: "User cancelled payment info");
        }
        
        cardIOView.removeFromSuperview()
    }
    
    private func startScanVC() -> Void {
        // 扫描框
        let cardIOView:CardIOView = CardIOView.init()
        cardIOView.languageOrLocale = "zh-Hans"
        //cardIOView.scanOverlayView.isHidden = true
        cardIOView.guideColor = KTopicTintColor
        cardIOView.hideCardIOLogo = true
        cardIOView.delegate = self
        self.cardBorderView.addSubview(cardIOView)
        cardIOView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.cardBorderView)
            make.centerY.equalTo(self.cardBorderView)
            //make.size.equalTo(cardIOView.cameraPreviewFrame.size)
            make.width.equalTo(self.cardBorderView)
            make.height.equalTo(self.view)
        }
        scanFlag = true
    }
    
    @objc func copyText()->Void{
        let paste = UIPasteboard.general
        guard let str = textView.text else {
            DLog(msg: "字符串长度有问题, copy失败")
            cpBtn.setTitle("复制失败", for: .normal)
            DispatchQueue.global().asyncAfter(deadline: .now()+2, execute: {
                DispatchQueue.main.async {
                    [unowned self] in
                    self.cpBtn.setTitle("复 制", for: .normal)
                }
            })
            return
        }
        let sidx = str.index(str.startIndex, offsetBy: 2)
        paste.string = String(str[sidx...])
        cpBtn.setTitle("已复制", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = KAppleGrayColor
        // Do any additional setup after loading the view.
        
        load()
        
        if !CardIOUtilities.canReadCardWithCamera() {
            self.textView.text = "  摄像头无法识别"
            scanFlag = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CardIOUtilities.preload()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !scanFlag {
            self.startScanVC()
        }
        
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
