//
//  SettingCell.h
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingModel;

@interface SettingCell : UITableViewCell

+(instancetype)settingCellWithTableView:(UITableView*)tableView;

@property (strong,nonatomic)UITextField *defTextField;

@property(nonatomic,strong)SettingModel * items;

@end
