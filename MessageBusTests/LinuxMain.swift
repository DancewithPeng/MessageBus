import XCTest

import DPMessageBus

var tests = [XCTestCaseEntry]()
tests += MessageBusTests.allTests()
XCTMain(tests)
