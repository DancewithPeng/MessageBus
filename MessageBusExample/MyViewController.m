//
//  MyViewController.m
//  MessageBusExample
//
//  Created by 张鹏 on 2019/4/19.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

#import "MyViewController.h"
#import "MessageBusTester.h"

@interface MyViewController () <MBMessageObserver>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0f];
    
    [self.view addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureDidTraggle:)]];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDidTraggle:)]];
    
    NSInteger index = [self.navigationController.childViewControllers indexOfObject:self];
    self.navigationItem.title = [NSString stringWithFormat:@"MyViewController : %ld", (long)index];
    
    [[[MessageBusTester sharedTester] msgBus] addObserver:self];
}

- (void)longPressGestureDidTraggle:(UILongPressGestureRecognizer *)longPressGesture {
    [self.navigationController pushViewController:[[MyViewController alloc] init] animated:YES];
}

- (void)tapGestureDidTraggle:(UITapGestureRecognizer *)tapGesture {
    
    NSString *message = [NSString stringWithFormat:@"message: %@", self.navigationItem.title];
    NSString *myInfo = self.navigationItem.title ? self.navigationItem.title : @"空";
    
    // 测试发送普通信息
    [[[MessageBusTester sharedTester] msgBus] sendMessage:message withInfo:@{@"MyInfoKey": myInfo}];
    
    // 测试发送异步信息
    NSString *asyncMessage = [NSString stringWithFormat:@"asyncMessage: %@", self.navigationItem.title];
    [[[MessageBusTester sharedTester] msgBus] sendAsyncMessage:asyncMessage withInfo:@{@"MyInfoKey": myInfo} callback:^(NSDictionary<NSString *,id> * _Nonnull info) {
        NSLog(@"callbackInfo: %@", info);
    }];
    
    // 测试发送广播信息
    NSString *postMessage = [NSString stringWithFormat:@"postMessage: %@", self.navigationItem.title];
    [[[MessageBusTester sharedTester] msgBus] postMessage:postMessage withInfo:@{@"MyInfoKey": myInfo}];
}

- (id)bus:(MBMessageBus *)bus didReceivedMessage:(NSString *)message info:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, self.navigationItem.title, message, info);
    return @"asd";
}

- (BOOL)bus:(MBMessageBus *)bus didReceivedAsyncMessage:(NSString *)message info:(NSDictionary<NSString *,id> *)info callback:(MBMessageHandingCallback)callback {
    
    NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, self.navigationItem.title, message, info);
    
    if (callback) {
        callback(@{@"AsyncMessageCallback": @"💥💥💥"});
    }
    
    return YES;
}

- (void)bus:(MBMessageBus *)bus didReceivedPostMessage:(NSString *)message info:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%s, %@, %@, %@", __PRETTY_FUNCTION__, self.navigationItem.title, message, info);
}

- (void)dealloc {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, self.navigationItem.title);
}

@end
