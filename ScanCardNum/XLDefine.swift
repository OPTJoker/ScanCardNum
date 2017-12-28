//
//  XLDefine.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/26.
//  Copyright © 2017年 Allen. All rights reserved.
//



import UIKit

/*  **** String Tools ***  */
func DLog<T>(msg:T, file:String = #file, funcName: String = #function, lineNum: Int = #line){
    #if DEBUG
        let fileName:String = (file as NSString).pathComponents.last!.replacingOccurrences(of: ".swift", with: "")
        print("[\(fileName)]<\(funcName)|\(lineNum)>:\(msg)")
    #else
        //print()
    #endif
}


/*  **** Color Tools ***  */
public func UIColorFromRGB(rgb: UInt) -> UIColor{
    return UIColor(
        red: CGFloat((rgb&0xff0000)>>16) / 255.0,
        green: CGFloat((rgb&0x00ff00)>>8) / 255.0,
        blue: CGFloat(rgb&0x0000ff) / 255.0,
        alpha: 1.0
    )
}

public func KColor(r: UInt, g: UInt, b:UInt) -> UIColor{
    return UIColor(
        red: CGFloat(r)/255.0,
        green: CGFloat(g) / 255.0,
        blue: CGFloat(b) / 255.0,
        alpha: 1.0
    )
}

public let KAppleGrayColor:UIColor = KColor(r: 236, g: 236, b: 236)
public let KTopicTintColor:UIColor = KColor(r: 61, g: 140, b: 127)


/*  **** Frame Tools ***  */
public let KSCRW = UIScreen.main.bounds.size.width
public let KSCRH = UIScreen.main.bounds.size.height
public let KNAVH:CGFloat = KSCRH>=812.0 ? 88.0 : 64.0





class XLDefine: NSObject {}
