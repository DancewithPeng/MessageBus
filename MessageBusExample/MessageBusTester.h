//
//  MessageBusTester.h
//  MessageBusExample
//
//  Created by 张鹏 on 2019/4/19.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageBus/MessageBus.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageBusTester : NSObject

@property (nonatomic, readonly, strong) MBMessageBus *msgBus;

+ (instancetype)sharedTester;

@end

NS_ASSUME_NONNULL_END
