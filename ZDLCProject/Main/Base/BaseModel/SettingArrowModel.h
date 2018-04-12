//
//  SettingArrowModel.h
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import "SettingModel.h"

@interface SettingArrowModel : SettingModel


@property (assign,nonatomic) Class skipClass;


@property (nonatomic,strong)NSDictionary* params;


+(instancetype)settingModelWithTitle:(NSString *)title TitleColor:(UIColor*)color withIcon:(NSString *)icon withCenterTitle:(NSString*)center CenterColor:(UIColor*)centerColor withSkipClass:(Class)skipClass  withParams:(NSDictionary*)params withRightTitle:(NSString *)RightTitle RightColor:(UIColor*)rightColor withRightIcon:(NSString *)RightIcon ;




@end
