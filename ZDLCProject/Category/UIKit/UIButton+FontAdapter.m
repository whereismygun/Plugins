//
//  UIButton+FontAdapter.m
//  ttl
//
//  Created by why on 2017/11/17.
//  Copyright © 2017年 why. All rights reserved.
//

#import "UIButton+FontAdapter.h"
#import <objc/runtime.h>


@implementation UIButton (FontAdapter)

+(void)load{
    
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}


- (id)myInitWithCoder:(NSCoder *)aDecode{
    
    [self myInitWithCoder:aDecode];
    if (self) {
        if (self.tag != 555) {
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize * SizeScale];
        }else{
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [UIFont fontWithName:@"DINCondensed-Bold" size:fontSize*SizeScale];
        }
    }
    return self;
}

@end
