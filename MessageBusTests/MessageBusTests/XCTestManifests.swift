//
//  File.swift
//  
//
//  Created by 张鹏 on 2020/9/25.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MessageBusTests.allTests),
    ]
}
#endif
