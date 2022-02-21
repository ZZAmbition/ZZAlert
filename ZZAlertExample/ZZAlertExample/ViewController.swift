//
//  ViewController.swift
//  ZZAlertExample
//
//  Created by meta on 2022/2/21.
//

import UIKit

class ViewController: UIViewController {
    let alert: SampleAlertView = {
        var alert = SampleAlertView(title: "提示", detail: "晚上八点直播间不见不散！")
        alert.alertCornerRadius = 4
        alert.enterMode = .bottom
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        alert.show()
    }
    
}

