//
//  MessageBusTester.m
//  MessageBusExample
//
//  Created by 张鹏 on 2019/4/19.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

#import "MessageBusTester.h"

@implementation MessageBusTester

@synthesize msgBus = _msgBus;

+ (instancetype)sharedTester {
    
    static MessageBusTester *_tester;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tester = [[MessageBusTester alloc] init];
    });
    
    return _tester;
}

- (MBMessageBus *)msgBus {
    if (_msgBus == nil) {
        _msgBus = [[MBMessageBus alloc] init];
    }
    
    return _msgBus;
}

@end
