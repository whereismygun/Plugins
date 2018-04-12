//
//  SettingPerformModel.h
//  ttl
//
//  Created by why on 2017/12/13.
//  Copyright © 2017年 why. All rights reserved.
//

#import "SettingModel.h"

typedef void(^clickBlock)();

@interface SettingPerformModel : SettingModel

@property (nonatomic,assign)BOOL hideArrow;


@property (nonatomic,strong)clickBlock click_block;

+(instancetype)settingModelWithTitle:(NSString *)title TitleColor:(UIColor*)color withIcon:(NSString *)icon withCenterTitle:(NSString*)center CenterColor:(UIColor*)centerColor withRightTitle:(NSString *)RightTitle RightColor:(UIColor*)rightColor withRightIcon:(NSString *)RightIcon callBlack:(clickBlock)callback ;


@end
