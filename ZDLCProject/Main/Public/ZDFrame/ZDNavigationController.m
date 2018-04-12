//
//  ZDNavigationController.m
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//

#import "ZDNavigationController.h"

@interface ZDNavigationController ()

@end

@implementation ZDNavigationController


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}




+(void)initialize{
    
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    navigationBar.layer.shadowColor = [UIColor blackColor].CGColor;
    
    navigationBar.layer.shadowOffset = CGSizeMake(0, 10);
    
    navigationBar.layer.shadowOpacity = 0.2;
    
    navigationBar.layer.shadowRadius = 16;
    
}


- (void)setNVTranslucent {
    
    self.navigationBar.translucent=YES;
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:17*SizeScale],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


- (void)unsetNVTranslucent{
    
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationBar setShadowImage:nil];
    [self.navigationBar setTitleTextAttributes:
     @{ NSForegroundColorAttributeName:[UIColor blackColor]}];
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
