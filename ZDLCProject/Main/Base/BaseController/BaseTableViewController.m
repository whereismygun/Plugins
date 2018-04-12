//
//  BaseTableViewController.m
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController


-(instancetype)initWithStyle:(UITableViewStyle)style{
    
    
    return [super initWithStyle:UITableViewStyleGrouped];
}




-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
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

-(NSMutableArray*)dataArray{
    if (_dataArray==nil) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}




-(NSDictionary*)getParams{
    return _params;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame=CGRectZero;
    if (self.navigationController.viewControllers.count>1) {
        [self navigationItemInit];
    }
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    
}
- (void)navigationItemInit {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80,30)];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"shape"] forState:UIControlStateNormal];
      btn.imageEdgeInsets=UIEdgeInsetsMake(0, -70, 0, 0);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
    
}
- (void)back {

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)reloadContent{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    Group*group = self.dataArray[section];
    
    return group.items.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingCell*set=[SettingCell settingCellWithTableView:tableView];
    
    Group*group = self.dataArray[indexPath.section];
    
    set.items = group.items[indexPath.row];
                      
    return set;
      

}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    Group*group=self.dataArray[indexPath.section];
    
    SettingModel*items= group.items[indexPath.row];
    
    if ([items isKindOfClass:[SettingArrowModel class]]) {
        
        SettingArrowModel* arrow = (SettingArrowModel*)items;
        
      if (arrow.skipClass == nil) return;

        if ([arrow.skipClass superclass]==[BaseViewController class]) {
            BaseViewController*vc =[[arrow.skipClass alloc]init];
            vc.params=arrow.params;
             [self.navigationController pushViewController:vc animated:YES];
        }
        if ([arrow.skipClass superclass]==[BaseTableViewController class]) {
            BaseTableViewController*vc =[[arrow.skipClass alloc]init];
            vc.params=arrow.params;
             [self.navigationController pushViewController:vc animated:YES];
        }
       
    }
    if([items isKindOfClass:[SettingPerformModel class]]){
        
        SettingPerformModel* perform = (SettingPerformModel*)items;
        if (!perform.click_block) return;
          perform.click_block();
    }
    
}




@end
