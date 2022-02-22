//
//  ZZAlertUtils.swift
//  ZZHud
//
//  Created by imagine on 2021/11/25.
//

import UIKit

struct ZZAlertUtils {
    

    public static let NaviHeight:CGFloat = (StatusHeight + 44)
    public static let TabbarHeight:CGFloat  = (StatusHeight > 20 ? 83 : 49)
    public static let topOffset:CGFloat = StatusHeight
    public static let bottomOffset:CGFloat = isIphoneXSeries() ? 10 : 0
    
    public static var StatusHeight: CGFloat {
        if #available(iOS 13.0, *) {
            if UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0 > 0 {
                return (UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height)!
            }else{
                return layoutInsets().top
            }
        } else {
            if UIApplication.shared.statusBarFrame.height > 0 {
                return UIApplication.shared.statusBarFrame.height
            }else{
                return layoutInsets().top
            }
        }
    }
    
    
    public static func isIphoneXSeries() -> Bool {
        var isIphoneXSeries = false
        if UIDevice().userInterfaceIdiom == .phone {
            if let mainWindow = UIApplication.shared.delegate?.window {
                if #available(iOS 11.0, *) {
                    if mainWindow?.safeAreaInsets.bottom ?? 0 > 0 {
                        isIphoneXSeries = true
                    }
                }
            }
        }
        return isIphoneXSeries
    }
    
    
    public static func layoutInsets() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            if let mainWindow = UIApplication.shared.delegate?.window {
                let safeAreaInsets: UIEdgeInsets = mainWindow!.safeAreaInsets
                if safeAreaInsets.bottom > 0 {
                    //参考文章：https://mp.weixin.qq.com/s/Ik2zBox3_w0jwfVuQUJAUw
                    return safeAreaInsets
                }
                return UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
            }
        }
        return UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
    }
    
}
