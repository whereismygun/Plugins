//
//  UIResponder+Router.h
//  ttl
//
//  Created by why on 2018/2/28.
//  Copyright © 2018年 why. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
