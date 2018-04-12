//
//  SettingArrowModel.m
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import "SettingArrowModel.h"

@implementation SettingArrowModel


+(instancetype)settingModelWithTitle:(NSString *)title TitleColor:(UIColor *)color withIcon:(NSString *)icon withCenterTitle:(NSString*)center CenterColor:(UIColor*)centerColor withSkipClass:(Class)skipClass withParams:(NSDictionary*)params withRightTitle:(NSString *)RightTitle RightColor:(UIColor *)rightColor withRightIcon:(NSString *)RightIcon{
    
    SettingArrowModel * items = [self settingModelWithTitle:title withTitleColor:color withIcon:icon withCenterTitle:center CenterColor:centerColor withRightTitle:RightTitle withRightColor:rightColor withRightIcon:RightIcon];
    
    items.params=params;
    items.skipClass=skipClass;
    
    return items;
}


@end
