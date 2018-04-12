//
//  BaseTableViewController.h
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingModel.h"
#import "SettingArrowModel.h"
#import "SettingCell.h"
#import "Group.h"

@interface BaseTableViewController : UITableViewController

@property (nonatomic,strong)NSDictionary*params;

@property (strong,nonatomic) NSMutableArray * dataArray;

-(NSDictionary*)getParams;



@end
