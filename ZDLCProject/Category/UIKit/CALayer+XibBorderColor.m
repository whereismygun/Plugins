//
//  CALayer+XibBorderColor.m
//  ttl
//
//  Created by why on 2017/12/4.
//  Copyright © 2017年 why. All rights reserved.
//

#import "CALayer+XibBorderColor.h"
#import <UIKit/UIKit.h>


@implementation CALayer (XibBorderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
