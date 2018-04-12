//
//  SettingModel.h
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModel : NSObject


@property (nonatomic,copy)NSString* title;

@property (nonatomic,strong)UIColor* color;

@property (nonatomic,strong)UIColor* rightColor;

@property (nonatomic,strong)NSString*center;

@property (nonatomic,strong)UIColor *centerColor;

@property (nonatomic,strong)NSString* rightTitle;

@property (nonatomic,copy)NSString* rightIcon;

@property (nonatomic,copy)NSString* icon;

@property (nonatomic,copy)NSString* centerTitle;


+(instancetype)settingModelWithTitle:(NSString*)title withIcon:(NSString*)icon;

+(instancetype)settingModelWithTitle:(NSString *)title;

+(instancetype)settingModelWithTitle:(NSString *)title withTitleColor:(UIColor*)color withIcon:(NSString *)icon withCenterTitle:(NSString*)center CenterColor:(UIColor*)centerColor withRightTitle:(NSString*)rightTitle withRightColor:(UIColor*)rightColor withRightIcon:(NSString*)rightIcon;




@end
