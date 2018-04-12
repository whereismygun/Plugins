//
//  UILabel+FTCornerdious.m
//  ttl
//
//  Created by why on 2018/1/29.
//  Copyright © 2018年 why. All rights reserved.
//

#import "UILabel+FTCornerdious.h"

@implementation UILabel (FTCornerdious)
-(void)setFTCornerdious:(CGFloat)cornerdious{
    
    
    self.layer.cornerRadius = cornerdious;
    
    self.layer.masksToBounds = YES;
    
}

-(void)setFTBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    
}


-(void)setFtCornerdious:(CGFloat)cornerdious Corners:(UIRectCorner)corners {
    
    //
    //    UIBezierPath * maskPath =[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerdious, cornerdious)];
    //
    //
    //    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    //    maskLayer.frame = self.bounds;
    //    maskLayer.path = maskPath.CGPath;
    //
    //    self.layer.mask = maskLayer;

    
}

@end
