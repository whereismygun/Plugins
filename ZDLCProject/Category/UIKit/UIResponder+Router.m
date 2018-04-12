//
//  UIResponder+Router.m
//  ttl
//
//  Created by why on 2018/2/28.
//  Copyright © 2018年 why. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    
    [self.nextResponder routerEventWithName:eventName userInfo:userInfo];
}

@end
