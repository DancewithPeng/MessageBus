//
//  ViewController.swift
//  MessageBusExample-Swift
//
//  Created by 张鹏 on 2019/4/19.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import MessageBus

class ViewController: UIViewController {
    
    let bus = MBMessageBus()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bus.add(self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        bus.sendMessage("Demo", withInfo: ["Demo": "1111"])
        bus.sendAsyncMessage("asdf", withInfo: ["asdf": "asdf"]) { (info) in
            
        }
        
        bus.postMessage("Demo", withInfo: ["Demo": "1111"])
    }
}

extension ViewController: MBMessageObserver {
    
    func bus(_ bus: MBMessageBus, didReceivedMessage message: String, info: [String : Any]?) -> Any? {
        print("\(#function)")
        
        return ""
    }
    
    func bus(_ bus: MBMessageBus, didReceivedAsyncMessage message: String, info: [String : Any]?, callback: MBMessageHandingCallback? = nil) -> Bool {
        print("\(#function)")
        return true
    }
    
    func bus(_ bus: MBMessageBus, didReceivedPostMessage message: String, info: [String : Any]?) {
        print("\(#function)")
    }
}
