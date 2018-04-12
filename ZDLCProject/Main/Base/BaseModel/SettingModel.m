//
//  SettingModel.m
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel


+(instancetype)settingModelWithTitle:(NSString *)title withIcon:(NSString *)icon{
    
    SettingModel*items=[[[self class]alloc]init];
    items.title=title;
    items.icon=icon;
    
    return items;
}

+(instancetype)settingModelWithTitle:(NSString *)title{
    
    return [self settingModelWithTitle:title withIcon:nil];
}

+(instancetype)settingModelWithTitle:(NSString *)title withTitleColor:(UIColor*)color withIcon:(NSString *)icon withCenterTitle:(NSString*)center CenterColor:(UIColor*)centerColor withRightTitle:(NSString*)rightTitle withRightColor:(UIColor*)rightColor withRightIcon:(NSString*)rightIcon{
    
    SettingModel*items = [[[self class]alloc]init];
    
    items.title=title;
    
    items.icon=icon;
    
    items.color=color;
    
    items.rightTitle=rightTitle;
    
    items.rightColor=rightColor;
    
    items.rightIcon=rightIcon;
    
    items.centerColor=centerColor;
    
    items.centerTitle=center;
    
    return items;
}


@end
