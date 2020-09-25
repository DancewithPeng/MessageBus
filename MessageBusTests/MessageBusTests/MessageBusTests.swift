//
//  File.swift
//  
//
//  Created by 张鹏 on 2020/9/25.
//

import XCTest
import DPMessageBus

final class MessageBusTests: XCTestCase {
    
    func testSayHi() {
        let bus = MBMessageBus()
        bus.postMessage("Hello World", withInfo: nil)
    }
    
    static var allTests = [
        ("testSayHi", testSayHi),
    ]
}
