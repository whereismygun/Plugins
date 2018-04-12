//
//  SettingPerformModel.m
//  ttl
//
//  Created by why on 2017/12/13.
//  Copyright © 2017年 why. All rights reserved.
//

#import "SettingPerformModel.h"

@implementation SettingPerformModel




+(instancetype)settingModelWithTitle:(NSString *)title TitleColor:(UIColor*)color withIcon:(NSString *)icon withCenterTitle:(NSString*)center CenterColor:(UIColor*)centerColor withRightTitle:(NSString *)RightTitle RightColor:(UIColor*)rightColor withRightIcon:(NSString *)RightIcon callBlack:(clickBlock)callback {
    
    SettingPerformModel * items = [self settingModelWithTitle:title withTitleColor:color withIcon:icon withCenterTitle:center CenterColor:centerColor withRightTitle:RightTitle withRightColor:rightColor withRightIcon:RightIcon];
    
    items.click_block=callback;
    
    return items;

}
@end
