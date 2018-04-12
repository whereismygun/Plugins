//
//  AppDelegate.m
//  ZDLC
//
//  Created by why on 2018/4/4.
//  Copyright © 2018年 why. All rights reserved.
//

#import "AppDelegate.h"
#import "ZDTabBarController.h"

@interface AppDelegate ()
@property (nonatomic,strong)NSDictionary*Envinfo;

@end

@implementation AppDelegate
static NSString *device_token = nil;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window setRootViewController:[[ZDTabBarController alloc]init]];
    self.window.backgroundColor = [UIColor whiteColor];
    
   // [self launchImageAndVideo];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


-(void)initEnvinfo{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Envinfo" ofType:@"plist"];
    _Envinfo = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
}

+ (void)setDeviceToken:(NSString *)dev
{
    device_token = dev;
}


+ (AppDelegate *)getAppDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


@end
