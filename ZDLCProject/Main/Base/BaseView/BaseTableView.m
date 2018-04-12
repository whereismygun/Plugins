//
//  BaseTableView.m
//  ttl
//
//  Created by why on 2017/12/12.
//  Copyright © 2017年 why. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView ()

@property (nonatomic,copy)NSString* url;

@property (nonatomic,strong)NSMutableArray* dataArray;

@property (nonatomic,strong)NSDictionary* params;

@property (nonatomic,strong)Class modelClass;

@property (nonatomic,copy)NSString * items;

@end

@implementation BaseTableView



-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style withURL:(NSString *)url modelClass:(Class)modelClass params:(NSDictionary *)params items:(NSString*)items{
    if (self = [super initWithFrame:frame style:style]) {
        
        self.dataArray = [NSMutableArray array];
        
        self.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        
        
         _items=items;
         _url=url;
         _params=params;
        _modelClass=modelClass;
        
       self.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
        [self.mj_header beginRefreshing];
    }
    return self;
}


-(void)requestData{
    
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
    
    if (_params) {
        [params setDictionary:_params];
    }

    [[HttpNetWork sharedInstance]getWithURLString:_url parameters:_params success:^(id object, BOOL isSuccess, NSString *errorMessage) {
        [self.mj_header endRefreshing];
        
        if (CHECK_DIC(object[@"data"])&&CHECK_ARR(object[@"data"][_items]))
        {
            [self dataRefresh:[_modelClass mj_objectArrayWithKeyValuesArray:object[@"data"][_items]]];
     
        }
    } failure:^(NSError *error) {
        NSString*err =CHECK_STR(error) ? (NSString*)error:@"服务器繁忙,请稍后再试";
        [LeafNotification showInController:self.viewController withText:err];
    }];
    
}

-(id)getObject:(NSIndexPath *)indexPath{

    return self.dataArray[indexPath.section];
}

-(id)getSource{
    return self.dataArray;
}


-(void)dataRefresh:(NSMutableArray *)mutableArray{
    if (self.dataArray==nil) {
         self.dataArray = mutableArray;
    }else{
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:mutableArray];
    }
    
       [self reloadData];
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView*view=[[UIView alloc]initWithFrame:CGRectZero];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView*view=[[UIView alloc]initWithFrame:CGRectZero];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellName = @"cellName";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    return cell;
}
@end
