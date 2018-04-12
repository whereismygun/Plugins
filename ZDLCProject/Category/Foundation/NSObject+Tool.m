//
//  NSObject+Tool.m
//  ttl
//
//  Created by why on 2018/1/26.
//  Copyright © 2018年 why. All rights reserved.
//

#import "NSObject+Tool.h"

@implementation NSObject (Tool)

-(NSAttributedString *)setString:(NSString *)str withColorOneStr:(NSString *)oneStr andColorOne:(UIColor *)colorOne andColorTwoStr:(NSString *)twoStr andColorTwo:(UIColor *)colorTwo{

    NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:str];
    NSRange range1=[[hintString string]rangeOfString:oneStr];
    [hintString addAttribute:NSForegroundColorAttributeName value:colorOne range:range1];
    NSRange range2=[[hintString string]rangeOfString:twoStr];
    [hintString addAttribute:NSForegroundColorAttributeName value:colorTwo range:range2];
    
    return hintString;
}

@end
