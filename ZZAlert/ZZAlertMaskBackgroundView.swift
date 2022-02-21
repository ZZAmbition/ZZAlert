//
//  AlertMaskBackgroundView.swift
//  ZZHud
//
//  Created by imagine on 2021/11/25.
//

import UIKit

public class ZZAlertMaskBackgroundView: UIView, UIGestureRecognizerDelegate {

    public var tapGestureBlock: ((_ gesture: UITapGestureRecognizer) -> ())?
    private var gesture: UITapGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gesture = UITapGestureRecognizer(target: self, action: #selector(tapClicked(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapClicked(_ gesture: UITapGestureRecognizer){
        if let tap = tapGestureBlock{
            tap(gesture)
        }
    }
    
    deinit {
        self.removeGestureRecognizer(gesture)
    }
}


