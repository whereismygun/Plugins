//
//  UILabel+FTCornerdious.h
//  ttl
//
//  Created by why on 2018/1/29.
//  Copyright © 2018年 why. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FTCornerdious)
-(void)setFTCornerdious:(CGFloat)cornerdious;//设置全部圆角
-(void)setFtCornerdious:(CGFloat)cornerdious  Corners:(UIRectCorner)corners ;  //设置圆角，设置某个位置的圆角
-(void)setFTBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;//设置border 以及color
@end
