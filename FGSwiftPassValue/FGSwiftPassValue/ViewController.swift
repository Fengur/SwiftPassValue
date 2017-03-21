//
//  ViewController.swift
//  FGSwiftPassValue
//
//  Created by Fengur on 2017/3/20.
//  Copyright © 2017年 Fengur. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ValueControllerDelegate{
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var showMsgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pass Value"
        self.startBtn.layer.cornerRadius = 10
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.recieveNotifi(_:)), name: NSNotification.Name(rawValue: ValueVCNotifiIdentifier), object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let targetVC = segue.destination as! ValueController
        targetVC.delegate = self
        targetVC.valueBlock = {(msg:String)->Void in
            self.showMessageWith(msg: msg)
        }
    }
    
    func recieveNotifi(_ notification : Notification)
    {
        let userInfo = notification.userInfo
        showMessageWith(msg: userInfo!["info"] as! String)
    }
    
    func delegateBtnClicked(msg: String) {
        showMessageWith(msg: msg)
    }
    
    func showMessageWith(msg:String){
        self.showMsgLabel.text = msg
        self.showMsgLabel.backgroundColor = UIColor.groupTableViewBackground
        self.showMsgLabel.textColor = UIColor.black
        
        UIView.animate(withDuration: 0.5, animations: {
            self.showMsgLabel.transform = CGAffineTransform.init(scaleX: 1, y: 1.3)
        }) { (true) in
            UIView.animate(withDuration: 0.5) {
                self.showMsgLabel.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

