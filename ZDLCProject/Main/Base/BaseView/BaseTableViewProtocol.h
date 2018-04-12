//
//  BaseTableViewProtocol.h
//  ttl
//
//  Created by why on 2017/12/12.
//  Copyright © 2017年 why. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseTableViewProtocol <UITableViewDelegate,UITableViewDataSource>

// 子类获取数据的接口
- (id)getObject:(NSIndexPath *)indexPath;

// 给外界提供的接口
- (void)dataRefresh:(NSMutableArray *)mutableArray;


- (id)getSource;



@end

