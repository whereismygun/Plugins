//
//  ZDTabBarController.m
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//

#import "ZDTabBarController.h"
#import "ZDNavigationController.h"

#import "ZDEnterController.h"
#import "ZDFinancingController.h"
#import "ZDDiscoverController.h"
#import "ZDPersonalController.h"



@interface ZDTabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZDTabBarController



- (instancetype)init {
    self=[super init];
    
    if (self) {
        
        [self setupTabBarController];
        
        self.tabBar.selectedImageTintColor = RGB(182,65,65);
        
    }
    return self;
}
- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self mpViewControllers];
    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
}
- (NSArray *)mpViewControllers {
    
    ZDEnterController *firstViewController = [[ZDEnterController alloc] init];
    UINavigationController *firstNavigationController = [[ZDNavigationController alloc]
                                                         initWithRootViewController:firstViewController];
    
    ZDFinancingController *secondViewController = [[ZDFinancingController alloc] init];
    UINavigationController *secondNavigationController = [[ZDNavigationController alloc]
                                                          initWithRootViewController:secondViewController];
    
    ZDDiscoverController *thirdViewController = [[ZDDiscoverController alloc] init];
    UINavigationController *thirdNavigationController = [[ZDNavigationController alloc]
                                                         initWithRootViewController:thirdViewController];
    
    ZDPersonalController *fourthViewController = [[ZDPersonalController alloc] init];
    UINavigationController *fourthNavigationController = [[ZDNavigationController alloc]
                                                          initWithRootViewController:fourthViewController];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}


- (NSArray *)tabBarItemsAttributesForController {
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"热门推荐",
                                                 CYLTabBarItemImage : @"enter",
                                                 CYLTabBarItemSelectedImage : @"enter_highlight",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"理财产品",
                                                  CYLTabBarItemImage : @"financing",
                                                  CYLTabBarItemSelectedImage : @"financing_highlight",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"发现",
                                                 CYLTabBarItemImage : @"discover",
                                                 CYLTabBarItemSelectedImage : @"discover_highlight",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的资产",
                                                  CYLTabBarItemImage : @"mine",
                                                  CYLTabBarItemSelectedImage : @"mine_highlight"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
