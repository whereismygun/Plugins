//
//  BaseTableView.h
//  ttl
//
//  Created by why on 2017/12/12.
//  Copyright © 2017年 why. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewProtocol.h"

@interface BaseTableView : UITableView<BaseTableViewProtocol>

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style withURL:(NSString*)url modelClass:(Class)modelClass params:(NSDictionary*)params items:(NSString*)items;



@end
