//
//  BaseViewController.h
//  ttl
//
//  Created by why on 2017/10/17.
//  Copyright © 2017年 why. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTBaseViewControllerDataSource <NSObject>

-(UIButton*)set_leftButton;
-(UIButton*)set_rightButton;
-(BOOL)NavigationTranslucent;


@end


@protocol TTBaseViewControllerDelegate <NSObject>


-(void)left_button_event:(UIButton*)sender;
-(void)right_button_event:(UIButton*)sender;


@end

@interface BaseViewController : UIViewController<TTBaseViewControllerDelegate,TTBaseViewControllerDataSource>

@property (nonatomic,strong)NSDictionary*params;

- (NSDictionary*)getSuperParams;


- (void)renderNetworkSubviews:(BOOL)isNetwork;

- (void)showLoading;

- (void)hideLoading;

- (void)reloadData;







@end
