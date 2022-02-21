//
//  SampleAlertView.swift
//  ZZAlertExample
//
//  Created by meta on 2022/2/21.
//

import UIKit

class SampleAlertView: UIView {
    
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 18)
        lab.textAlignment = .center
        return lab
    }()
    
    let detailLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 13)
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
    
    let closeBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setImage(UIImage(named: "icon_close"), for: UIControl.State.normal)
        return btn
    }()
    
    let confirmBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("确认", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String,detail: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
        self.addSubview(closeBtn)
        self.addSubview(confirmBtn)
        
        
        titleLabel.frame = CGRect(x: 50, y: 10, width: 100, height: 21)
        detailLabel.frame = CGRect(x: 20, y: 40, width: 160, height: 60)
        closeBtn.frame = CGRect(x: 160, y: 0, width: 40, height: 40)
        confirmBtn.frame = CGRect(x: 50, y: 120, width: 100, height: 44)
        
        titleLabel.text = title
        detailLabel.text = detail
        
        closeBtn.addTarget(self, action:#selector(closeAlert), for: UIControl.Event.touchUpInside)
        confirmBtn.addTarget(self, action:#selector(comfirm), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeAlert(){
        self.hide()
    }
    
    @objc func comfirm(){
        self.hide()
    }
}


extension SampleAlertView: ZZAlertViewProtocol {
    
    func contentView() -> UIView {
        self
    }
}
