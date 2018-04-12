//
//  ZDUser.m
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//

#import "ZDUser.h"
#import "ZDTabBarController.h"
#import "ZDNavigationController.h"


static ZDUser *user;

@implementation ZDUser

+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"userId":@"id"};
}
//创建单例
+(ZDUser*)ZDUser
{
    if (!user)
    {
        user = [[ZDUser alloc]init];
    }
    return user;
}
+(void)dropOutUser
{
    user=nil;
}

//------------------------登陆设置-----------------------
#pragma mark- loginSetting

#define kLoginUserName              @"LoginUserName"
#define kLoginUserPassword          @"LoginUserPassword"
#define kLoginIsLogin               @"Login"
#define kUserID                     @"UserID"
#define kUserAddress                @"UserAddress"
#define kUserBirthday               @"UserBirthday"
#define kUserIdentityNo             @"UserIdentityNo"
#define kUserPayPass                @"UserPayPass"
#define kUserSex                    @"Sex"
#define kUserName                   @"UserName"
#define kUserPhone                  @"UserPhone"
#define kUserEmail                  @"UserEmail"
#define KUserAgent                  @"UserAgent"
#define kfirstLogin                 @"First"
#define KisCertification            @"isCertification"
#define KisSitePass                 @"isSitePass"
#define KisTiedCard                 @"isTiedCard"
#define KpassOCR                    @"passOCR"
#define KpropertyHide               @"propertyHide"


//判断是否已登录
+(BOOL)loginIsLogin
{
    id  isLogin=[[NSUserDefaults standardUserDefaults]objectForKey:kLoginIsLogin];
    if ([isLogin isKindOfClass:[NSString class]])
    {
        if ([isLogin isEqualToString:kLoginIsLogin])
        {
            return YES;
        }
    }
    return NO;
}
//设置已经登录
+(void)loginSetLogin
{
    [[NSUserDefaults standardUserDefaults]setObject:kLoginIsLogin forKey:kLoginIsLogin];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
//注销登录
+(void)loginCancelLogin
{
    [ZDUser dropOutUser];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:kLoginIsLogin];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [ZDUser loginShowLoginView];
}
//显示登录界面
+(void)loginShowLoginView{
    if ([ZDUser loginIsLogin])
    {
        return;
    }
    //TTLoginViewController *loginVC = [[TTLoginViewController alloc] init];
    UIViewController *vc = [[UIViewController alloc]init];
    
    ZDNavigationController *nav = [[ZDNavigationController alloc] initWithRootViewController:vc];
    
    
    [UIApplication.sharedApplication.delegate.window.rootViewController presentViewController:nav animated:YES completion:NULL];
    
    
}

//退出登录
+(void)loginExit{
    [ZDUser dropOutUser];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:kLoginIsLogin];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(void)loginHiddenLoginView
{
    [UIApplication.sharedApplication.delegate.window.rootViewController.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    
    ZDTabBarController*tab = (ZDTabBarController*)[Utils getCurrentVC];
    
    NSArray*arrvc = [tab viewControllers];
    
    ZDNavigationController*nv = [arrvc objectAtIndex:tab.selectedIndex];

    
    [nv popToRootViewControllerAnimated:YES];
}


//记住密码
+(void)loginRemenberUserName:(NSString*)userName password:(NSString*)password{
    
    [[NSUserDefaults standardUserDefaults]setObject:userName forKey:kLoginUserName];
    [[NSUserDefaults standardUserDefaults]setObject:password forKey:kLoginUserPassword];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(void)userMessagePersistence:(ZDUser *)data{
    
    
    [[NSUserDefaults standardUserDefaults]setObject:data.address forKey:kUserAddress];
    [[NSUserDefaults standardUserDefaults]setObject:data.birthday forKey:kUserBirthday];
    [[NSUserDefaults standardUserDefaults]setObject:data.identityNo forKey:kUserIdentityNo];
    [[NSUserDefaults standardUserDefaults]setObject:data.userId forKey:kUserID];
    [[NSUserDefaults standardUserDefaults]setObject:data.name forKey:kUserName];
    [[NSUserDefaults standardUserDefaults]setObject:data.phone forKey:kUserPhone];
    [[NSUserDefaults standardUserDefaults]setObject:data.email forKey:kUserEmail];
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.agent] forKey:KUserAgent];
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.paypass] forKey:kUserPayPass];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInteger:data.sex] forKey:kUserSex];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.isCertification] forKey:KisCertification];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.isSitePass] forKey:KisSitePass];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.passOCR] forKey:KpassOCR];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.isTiedCard] forKey:KisTiedCard];
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithBool:data.propertyHide] forKey:KpropertyHide];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(ZDUser *)getUserMessage {
    
    ZDUser *user = [ZDUser ZDUser];
    
    user.address = [[NSUserDefaults standardUserDefaults]objectForKey:kUserAddress];
    user.birthday = [[NSUserDefaults standardUserDefaults]objectForKey:kUserBirthday];
    user.identityNo = [[NSUserDefaults standardUserDefaults]objectForKey:kUserIdentityNo];
    user.userId = [[NSUserDefaults standardUserDefaults]objectForKey:kUserID];
    user.name = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    user.email = [[NSUserDefaults standardUserDefaults]objectForKey:kUserEmail];
    user.phone = [[NSUserDefaults standardUserDefaults]objectForKey:kUserPhone];
    user.paypass = [[[NSUserDefaults standardUserDefaults]objectForKey:kUserPayPass]boolValue];
    user.sex = [[[NSUserDefaults standardUserDefaults]objectForKey:kUserSex]integerValue];
    user.isSitePass =  [[[NSUserDefaults standardUserDefaults]objectForKey:KisSitePass]boolValue];
    user.isTiedCard = [[[NSUserDefaults standardUserDefaults]objectForKey:KisTiedCard]boolValue];
    user.isCertification =  [[[NSUserDefaults standardUserDefaults]objectForKey:KisCertification]boolValue];
    user.passOCR =  [[[NSUserDefaults standardUserDefaults]objectForKey:KpassOCR]boolValue];
    user.agent = [[[NSUserDefaults standardUserDefaults]objectForKey:KUserAgent]boolValue];
    user.propertyHide =  [[[NSUserDefaults standardUserDefaults]objectForKey:KpropertyHide]boolValue];
    
    return user;
}


//读取账号和密码
+(NSArray*)loginGetUserNameAndPassword{
    
    NSString * userName = [[NSUserDefaults standardUserDefaults]objectForKey:kLoginUserName];
    NSString * userPassword = [[NSUserDefaults standardUserDefaults]objectForKey:kLoginUserPassword];
    NSArray * userInfo=@[userName,userPassword];
    
    return userInfo;
}

@end

