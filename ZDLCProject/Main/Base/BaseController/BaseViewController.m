//
//  BaseViewController.m
//  ttl
//
//  Created by why on 2017/10/17.
//  Copyright © 2017年 why. All rights reserved.
//

#import "BaseViewController.h"
#import "DetachNetwork.h"
#import "AFNetworking.h"
#import "UIResponder+Router.h"
#import "Loading.h"


@interface BaseViewController ()


@end

@implementation BaseViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    [self renderNavigationBarStyle];
    if (self.navigationController.viewControllers.count>1) {
     [self navigationItemInit];
    }
    
}




- (void)showLoading{
    [Loading showLoadingInSubView:self.view];
}

- (void)hideLoading{
    [Loading hideLoadingInsubView:self.view];
}




- (void)navigationItemInit {
    
    UIBarButtonItem*back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shape"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=back;
    
}

- (void)back {
                   
   [self.navigationController popViewControllerAnimated:YES];

}

- (void)renderNavigationBarStyle{
    

    [self leftButton];
    [self rightButton];
    [self setNavTranslucent];
    
}



-(BOOL)setNavTranslucent{
    
    BOOL Translucent=[self respondsToSelector:@selector(NavigationTranslucent)];

    if (Translucent) {
        [self.navigationController.navigationBar setTranslucent:YES];
        [self.navigationController setNavigationBarHidden:YES];
    }else{
        [self.navigationController.navigationBar setTranslucent:NO];
        [self.navigationController setNavigationBarHidden:NO];
    }
  
    return Translucent;
    
}



-(BOOL)leftButton {
   
    BOOL isleft = [self respondsToSelector:@selector(set_leftButton)];
    
    if (isleft) {
        UIButton*leftButton =[self set_leftButton];
        [leftButton addTarget:self action:@selector(right_button_event:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem*item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem=item;
    }
    return isleft;

}

-(NSDictionary*)getSuperParams{
    
    return _params;
}



-(BOOL)rightButton{
    
    BOOL isright = [self respondsToSelector:@selector(set_rightButton)];
    
    if (isright) {
        
        UIButton*rightButton=[self set_rightButton];
        [rightButton addTarget:self action:@selector(right_button_event:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem*item =[[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem=item;
    }
    return isright;
    
}



-(void)renderNetworkSubviews:(BOOL)isNetwork{
    
    if (isNetwork) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            for (UIView*view in self.view.subviews) {
                if ([view isKindOfClass:[DetachNetwork class]]) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [view removeFromSuperview];
                    });
                }
            }
        });
        if ([self respondsToSelector:@selector(reloadData)]) {
              [self reloadData];
            }
    }else{
    
        DetachNetwork *dn=[[NSBundle mainBundle]loadNibNamed:@"DetachNetwork" owner:nil options:nil].lastObject;
        dn.frame=self.view.bounds;
        [self.view addSubview:dn];
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self reachabilityNetwork];
    
}
-(void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    
    [self reachabilityNetwork];
}


-(void)reachabilityNetwork{

    NSUserDefaults*def=[NSUserDefaults standardUserDefaults];
    BOOL isNetwork = [[def objectForKey:@"Reachability"]boolValue];
    
    [self renderNetworkSubviews:isNetwork];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
