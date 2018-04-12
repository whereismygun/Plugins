//
//  RefreshTableView.h
//  ttl
//
//  Created by why on 2018/1/11.
//  Copyright © 2018年 why. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewProtocol.h"

@interface RefreshTableView : UITableView<BaseTableViewProtocol>

@property (nonatomic,strong)NSDictionary*params;


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style withURL:(NSString*)url modelClass:(Class)modelClass items:(NSString*)items;


@end
