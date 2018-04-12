//
//  UIView+Extent.m
//  ttl
//
//  Created by why on 2017/11/22.
//  Copyright © 2017年 why. All rights reserved.
//

#import "UIView+Extent.h"
#import <objc/runtime.h>


@implementation UIView (Extent)



- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


@end
