//
//  RefreshTableView.m
//  ttl
//
//  Created by why on 2018/1/11.
//  Copyright © 2018年 why. All rights reserved.
//

#import "RefreshTableView.h"
#import "EmptyData.h"


@interface RefreshTableView()

@property (nonatomic,copy)NSString* url;

@property (nonatomic,strong)NSMutableArray* dataArray;

@property (nonatomic,strong)Class modelClass;

@property (nonatomic,assign)NSInteger page;

@property (nonatomic,copy)NSString * items;

@end

@implementation RefreshTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style withURL:(NSString*)url modelClass:(Class)modelClass items:(NSString*)items{
    
    if (self=[super initWithFrame:frame style:style]) {
        
        _url =url;
        _dataArray=[NSMutableArray array];
        _modelClass=modelClass;
        _items=items;
        
        self.delegate=self;
        self.dataSource=self;
        
        
        self.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
        
        [self.mj_header beginRefreshing];
    }
    return self;
}


-(NSDictionary*)params{

    if (!_params) {
        _params=[NSDictionary dictionary];
    }
    return _params;
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

-(void)requestData{
    
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
    
    if (_params) {
        
        [params setDictionary:_params];
    }
    [params setValue:@"1" forKey:@"offset"];
    [params setValue:@"10" forKey:@"limit"];

    _page=1;
    
    [[HttpNetWork sharedInstance]getWithURLString:_url parameters:params success:^(id object, BOOL isSuccess, NSString *errorMessage) {
        
        [self.mj_header endRefreshing];
        [self showNoDataWithData:object];
        
        if (CHECK_DIC(object[@"data"]) && CHECK_ARR(object[@"data"][_items])){
            
                [self dataRefresh:[_modelClass mj_objectArrayWithKeyValuesArray:object[@"data"][_items]]];
                [self reloadData];
        }
    } failure:^(NSError *error) {
        NSString*err =CHECK_STR(error) ? (NSString*)error:@"服务器繁忙,请稍后再试";
        [LeafNotification showInController:self.viewController withText:err];
    }];
}


-(void)showNoDataWithData:(id)object{
    
    if ([object[@"data"][_items] isKindOfClass:[NSNull class]]) {
          [EmptyData showNoDataInSubView:self];
    }else{
        if (CHECK_ARR(object[@"data"][_items])) {
            NSArray*data=object[@"data"][_items];
            if (data.count==0) {
                [EmptyData showNoDataInSubView:self];
            }else{
                [EmptyData hideNoDataInsubView:self];
            }
            
            if (data.count>=10) {
                  self.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMore)];
            }
        }
    }
}


-(void)requestMore{
    
    self.page++;
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
    
    if (_params) {
        [params setDictionary:_params];
    }
    [params setValue:[NSString stringWithFormat:@"%ld",(long)_page] forKey:@"offset"];
    [params setValue:@"10" forKey:@"limit"];

    [[HttpNetWork sharedInstance]getWithURLString:_url parameters:params success:^(id object, BOOL isSuccess, NSString *errorMessage) {
        
         [self.mj_footer endRefreshing];
        
        if (CHECK_DIC(object[@"data"]) && CHECK_ARR(object[@"data"][_items])) {
            NSArray*data=object[@"data"][_items];
            if (data.count!=0) {
                if (self.dataArray.count==0) {
                    self.dataArray=[_modelClass mj_objectArrayWithKeyValuesArray:object[@"data"][_items]];
                }else{
                    NSArray*data=[_modelClass mj_objectArrayWithKeyValuesArray:object[@"data"][_items]];
                    [self.dataArray addObjectsFromArray:data];
                }
                [self reloadData];
            }else{
                [self.mj_footer endRefreshingWithNoMoreData];
            }
        }else{
            [self.mj_footer endRefreshingWithNoMoreData];
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
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellName = @"cellName";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    return cell;
}

@end
