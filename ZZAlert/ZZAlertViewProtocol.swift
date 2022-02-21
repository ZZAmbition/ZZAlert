//
//  AlertViewProtocol.swift
//  ZZHud
//
//  Created by imagine on 2021/11/23.
//

import UIKit

public enum ZZAlertViewPosition {
    case top
    case center
    case bottom
}

public enum ZZAlertViewEnterMode {
    case fadeIn
    case top
    case bottom
    case left
    case right
}

public enum ZZAlertViewLeaveMode {
    case fadeOut
    case top
    case bottom
    case left
    case right
}



public protocol ZZAlertViewProtocol {
    
    /// mask background color
    var maskBackgroundColor: UIColor {get set}
    /// alert background color
    var alertBackgroundColor: UIColor? {get set}
    /// animation
    var enterMode: ZZAlertViewEnterMode? {get set}
    var leaveMode: ZZAlertViewLeaveMode? {get set}
    /// alert position
    var alertViewPositon: ZZAlertViewPosition {get set}
    /// mask isUserInteractionEnabled
    var alertUserInteractionEnabled: Bool {get set}
    /// tap mask  Close
    var isCloseTapBackground: Bool {get set}
    /// default  have not
    var alertCornerRadius: CGFloat? {get set}
    
    func contentView() -> UIView
    func show()
    func hide()
    
}


private struct AssociatedKeys {
    static var maskBackgroundColorKey   = "maskBackgroundColorKey"
    static var alertBackgroundColorKey  = "alertBackgroundColorKey"
    static var alertViewPositonKey      = "alertViewPositonKey"
    static var enterModeKey             = "enterModeKey"
    static var leaveModeKey             = "leaveModeKey"
    static var alertUserInteractionEnabledKey = "alertUserInteractionEnabledKey"
    static var isCloseTapBackgroundKey = "isCloseTapBackgroundKey"
    static var alertCornerRadiusKey = "alertCornerRadiusKey"
}


extension ZZAlertViewProtocol {
    
   
    
    public var maskBackgroundColor: UIColor {
        get{
            let maskBackgroundColor =  objc_getAssociatedObject(self, &AssociatedKeys.maskBackgroundColorKey) as? UIColor
            if let color = maskBackgroundColor{
                return color
            }
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.maskBackgroundColorKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    
    public var alertBackgroundColor: UIColor? {
        get{
            let alertBackgroundColor =  objc_getAssociatedObject(self, &AssociatedKeys.alertBackgroundColorKey) as? UIColor
            if let color = alertBackgroundColor{
                return color
            }
            return UIColor.white
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.alertBackgroundColorKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    public var alertViewPositon: ZZAlertViewPosition {
        get{
            let alertViewPositon =  objc_getAssociatedObject(self, &AssociatedKeys.alertViewPositonKey) as? ZZAlertViewPosition
            if let positon = alertViewPositon{
                return positon
            }
            return .center
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.alertViewPositonKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
    public var enterMode: ZZAlertViewEnterMode? {
        get{
            let enterMode =  objc_getAssociatedObject(self, &AssociatedKeys.enterModeKey) as? ZZAlertViewEnterMode
            return enterMode
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.enterModeKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
    
    public var leaveMode: ZZAlertViewLeaveMode? {
        get{
            let leaveMode =  objc_getAssociatedObject(self, &AssociatedKeys.leaveModeKey) as? ZZAlertViewLeaveMode
            return leaveMode
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.leaveModeKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
    public var alertUserInteractionEnabled: Bool {
        get{
            let alertUserInteractionEnabled =  objc_getAssociatedObject(self, &AssociatedKeys.alertUserInteractionEnabledKey) as? Bool
            if let enable = alertUserInteractionEnabled{
                return enable
            }
            return true
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.alertUserInteractionEnabledKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
    public var isCloseTapBackground: Bool {
        get{
            let alertUserInteractionEnabled =  objc_getAssociatedObject(self, &AssociatedKeys.isCloseTapBackgroundKey) as? Bool
            if let enable = alertUserInteractionEnabled{
                return enable
            }
            return false
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.isCloseTapBackgroundKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
    public var alertCornerRadius: CGFloat? {
        get{
            let alertCornerRadius =  objc_getAssociatedObject(self, &AssociatedKeys.alertCornerRadiusKey) as? CGFloat
            return alertCornerRadius
        }
        set{
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.alertCornerRadiusKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
   
    
    
    public func setupUI(){
        let window = UIApplication.shared.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        let viewBackground = ZZAlertMaskBackgroundView(frame: UIScreen.main.bounds)
        viewBackground.tapGestureBlock = {tap in
            let point = tap.location(in: self.contentView())
            if self.isCloseTapBackground && !self.contentView().bounds.contains(point){
                self.hide()
            }
        }
        viewBackground.backgroundColor = maskBackgroundColor
        viewBackground.tag  = 29999
        viewBackground.isUserInteractionEnabled = self.alertUserInteractionEnabled
        window.addSubview(viewBackground)
        let content = self.contentView()
        if let color = self.alertBackgroundColor{
            content.backgroundColor = color
        }
        if let radius = self.alertCornerRadius{
            content.layer.cornerRadius = radius
        }
        viewBackground.addSubview(content)
    }
    
   
    
    public func show(){
        setupUI()
        
        let window = UIApplication.shared.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        let background = window.viewWithTag(29999)
        guard let viewBackground = background else { return }
        let content = self.contentView()
        var interval = 0.3
        var frame = content.bounds
        if let enter = self.enterMode {
            switch enter {
            case .top:
                frame.origin.y -= UIScreen.main.bounds.height
                frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                interval = 0.5
            case .bottom:
                frame.origin.y += UIScreen.main.bounds.height
                frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                interval = 0.5
            case .left:
                frame.origin.x -= UIScreen.main.bounds.width
                frame.origin.y = viewBackground.bounds.size.height/2 - frame.size.height/2
                interval = 0.5
            case .right:
                frame.origin.x += UIScreen.main.bounds.width
                frame.origin.y = viewBackground.bounds.size.height/2 - frame.size.height/2
                interval = 0.5
            case .fadeIn:
                break
            }
            
            content.frame = frame
            content.alpha = 0
            UIView.animate(withDuration: interval) {
                switch self.alertViewPositon{
                case .top:
                    frame.origin.y = viewBackground.bounds.origin.y + ZZAlertUtils.topOffset
                    frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                    content.frame = frame
                case .center:
                    content.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
                case .bottom:
                    frame.origin.y = viewBackground.bounds.size.height - frame.height - ZZAlertUtils.bottomOffset
                    frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                    content.frame = frame
                }
                content.alpha = 1
            } completion: { (finished) in
                
            }
        }else{
           
            switch self.alertViewPositon{
            case .top:
                frame.origin.y = viewBackground.bounds.origin.y + ZZAlertUtils.topOffset
                frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                content.frame = frame
            case .center:
                content.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
            case .bottom:
                frame.origin.y = viewBackground.bounds.size.height - frame.height - ZZAlertUtils.bottomOffset
                frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                content.frame = frame
            }
        }
    }
    
    
    public func hide(){
        let window = UIApplication.shared.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        let background = window.viewWithTag(29999)
        guard let viewBackground = background else { return }
        let content = self.contentView()
        var interval = 0.3
        var frame = content.bounds
        if let leave = self.leaveMode {
            switch leave {
            case .top:
                frame.origin.y -= UIScreen.main.bounds.height
                frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                interval = 0.5
            case .bottom:
                frame.origin.y += UIScreen.main.bounds.height
                frame.origin.x = viewBackground.bounds.size.width/2 - frame.size.width/2
                interval = 0.5
            case .left:
                frame.origin.x -= UIScreen.main.bounds.width
                frame.origin.y = viewBackground.bounds.size.height/2 - frame.size.height/2
                interval = 0.5
            case .right:
                frame.origin.x += UIScreen.main.bounds.width
                frame.origin.y = viewBackground.bounds.size.height/2 - frame.size.height/2
                interval = 0.5
            case .fadeOut:
                break
            }
            content.alpha = 1
            UIView.animate(withDuration: interval) {
                content.frame = frame
                content.alpha = 0
            } completion: { (finished) in
                content.removeFromSuperview()
                viewBackground.removeFromSuperview()
            }
        }else{
            content.frame = frame
            content.removeFromSuperview()
            viewBackground.removeFromSuperview()
        }
    }
    
}
