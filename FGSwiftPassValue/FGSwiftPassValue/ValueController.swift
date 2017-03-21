//
//  ValueController.swift
//  FGSwiftPassValue
//
//  Created by Fengur on 2017/3/21.
//  Copyright © 2017年 Fengur. All rights reserved.
//

import UIKit

protocol ValueControllerDelegate:NSObjectProtocol {
    func delegateBtnClicked(msg:String)
}

typealias closureBtnClickedSendValue = (_ msg:String)->Void
let ValueVCNotifiIdentifier = "ValueVCSendNofify"

class ValueController: UIViewController {
    @IBOutlet weak var delegateBtn: UIButton!
    @IBOutlet weak var closureBtn: UIButton!
    @IBOutlet weak var notifyBtn: UIButton!
    weak var delegate : ValueControllerDelegate?
    var valueBlock:closureBtnClickedSendValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.delegateBtn.layer.cornerRadius = 5
        self.closureBtn.layer.cornerRadius = 5
        self.notifyBtn.layer.cornerRadius = 5
    }

    @IBAction func delegateBtnClicked(_ sender: Any) {
        delegate?.delegateBtnClicked(msg: self.delegateBtn.currentTitle!)
        popSelf()
    }
    
    @IBAction func clousureBtnClicked(_ sender: Any) {
        if valueBlock != nil{
            valueBlock!(self.closureBtn.currentTitle!)
            popSelf()
        }
    }

    @IBAction func notifyBtnClicked(_ sender: Any) {
        let info = ["info":self.notifyBtn.currentTitle!]
        NotificationCenter.default.post(name: Notification.Name(rawValue: ValueVCNotifiIdentifier), object: self, userInfo: info)
        popSelf()
    }
    
    func popSelf(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
