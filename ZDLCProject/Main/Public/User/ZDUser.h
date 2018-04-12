//
//  ZDUser.h
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDUser : NSObject


@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *identityNo;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) BOOL isCertification;
@property (nonatomic, assign) BOOL isSitePass;
@property (nonatomic, assign) BOOL isTiedCard;
@property (nonatomic, assign) BOOL passOCR;
@property (nonatomic, assign) BOOL agent;
@property (nonatomic, assign) BOOL paypass;
@property (nonatomic, assign) BOOL propertyHide;

@property (nonatomic, assign) NSInteger sex;

+ (ZDUser *)ZDUser ;

#pragma mark -- userMessage

//** 记住密码 */
+(void)loginRemenberUserName:(NSString*)userName password:(NSString*)password;

//** 读取账号和密码 */
+(NSArray*)loginGetUserNameAndPassword;


//** 判断是否已登陆 */
+(BOOL)loginIsLogin;


//** 注销登录 */
+(void)loginCancelLogin;

//** 退出登录 */
+(void)loginExit;

//** 显示登录界面 */
+(void)loginShowLoginView;

//** 隐藏登录界面 */
+(void)loginHiddenLoginView;

//** 用户id持久化 */
+(void)userMessagePersistence:(ZDUser *)data;

//** 获取用户信息 */
+(ZDUser *)getUserMessage;


@end

