//
//  SettingCell.m
//  ttl
//
//  Created by why on 2017/11/24.
//  Copyright © 2017年 why. All rights reserved.
//

#import "SettingCell.h"

#import "SettingModel.h"
#import "SettingArrowModel.h"
#import "SettingPerformModel.h"


@interface SettingCell()

@property (strong,nonatomic)UIImageView *title_image;

@property (strong,nonatomic)UILabel *titile_label;

@property (strong,nonatomic)UILabel *right_label;

@property (strong,nonatomic)UIImageView *right_imge;

@property (strong,nonatomic)UILabel *center_label;



@end
static int row=0;

@implementation SettingCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    }
    return self;
}


+(instancetype)settingCellWithTableView:(UITableView*)tableView{
    
    static  NSString* ID = @"Setting";
    
    SettingCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        
        cell=[[SettingCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.tag=row;
        row=row+1;
        
    }
    return cell;
}


-(UIImageView*)title_image{
    
    if (_title_image==nil) {
        _title_image=[[UIImageView alloc]init];
        [self addSubview:_title_image];

        [_title_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self).offset(15);
        }];
        
    }
    return _title_image;
}

-(UILabel*)center_label{
    if (_center_label==nil) {
        _center_label=[[UILabel alloc]init];
        SettingModel*items = self.items;
         _center_label.font=[UIFont systemFontOfSize:14*SizeScale];
        [self addSubview:_center_label];
        if (items.centerTitle) {
            
            [_center_label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.centerX.equalTo(self.mas_centerX);
            }];
        }
    }
    return _center_label;
}

-(UIImageView*)right_imge{
    
    if (_right_imge==nil) {
        _right_imge=[[UIImageView alloc]init];
        SettingModel*items =self.items;
        [self addSubview:_right_imge];
        if (items.rightTitle) {
            [_right_imge mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.right.equalTo(_right_label.mas_left).offset(-5);
            }];
        }else{
            [_right_imge mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.right.equalTo(self).offset(-10);
            }];
        }

    }
    return _right_imge;
}

-(UITextField*)defTextField{
    
    if (_defTextField==nil) {
        _defTextField=[[UITextField alloc]init];
        _defTextField.tag=101;

        [self addSubview:_defTextField];
        [_defTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titile_label.mas_right).offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(20);
        }];
    }
    return _defTextField;
}
-(UILabel*)right_label{
    if (_right_label==nil) {
        _right_label=[[UILabel alloc]init];
        _right_label.font=[UIFont systemFontOfSize:14*SizeScale];
        [self addSubview:_right_label];
        [_right_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self).offset(-30);
         
        }];
        
    }
    return _right_label;

    
}
-(UILabel*)titile_label{
    
    if (_titile_label==nil) {
        _titile_label=[[UILabel alloc]init];
        [_titile_label setFont:[UIFont systemFontOfSize:14*SizeScale]];

        
        [self addSubview:_titile_label];
        if (self.items.icon) {
           [_titile_label mas_makeConstraints:^(MASConstraintMaker *make) {
               make.centerY.equalTo(self.mas_centerY);
               make.left.equalTo(_title_image.mas_right).offset(15);
               make.height.mas_equalTo(20);
            }];
        }else{
            [_titile_label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.left.equalTo(self).offset(15);
                make.height.mas_equalTo(20);
            }];
       
        }
 
    }
    return _titile_label;
}

-(void)setItems:(SettingModel *)items{
    
    _items = items;
    [self setUpContent];
    
}



-(void)setUpContent{
    
       [self coustomTitleWithImage];
    
    if ([self.items isKindOfClass:[SettingArrowModel class]]) {
        
        SettingArrowModel*item=(SettingArrowModel*)self.items;
        [self setBaseCell:item];
        self.accessoryType=item.skipClass ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
     
    }if ([self.items isKindOfClass:[SettingModel class]]) {
        
        SettingModel*item=(SettingModel*)self.items;
        
        [self setBaseCell:item];
        
    }
    if ([self.items isKindOfClass:[SettingTextFieldModel class]]) {
        
         self.defTextField.placeholder=@"请输入";
        
    }if ([self.items isKindOfClass:[SettingPerformModel class]]) {
        
        SettingPerformModel*item=(SettingPerformModel*)self.items;
         self.accessoryType=item.click_block ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        
          self.accessoryType= item.hideArrow ? UITableViewCellAccessoryNone:UITableViewCellAccessoryDisclosureIndicator;
        [self setBaseCell:item];
        
    }
    
}

-(void)setBaseCell:(SettingModel*)item{
    
    if (item.rightColor) self.right_label.textColor=item.rightColor;
    if (item.color) self.titile_label.textColor=item.color;
    if (item.rightTitle) self.right_label.text=item.rightTitle;
    if (item.centerTitle) self.center_label.text=item.centerTitle;
    if (item.centerColor) self.center_label.textColor=item.centerColor;
    self.right_imge.image=[UIImage imageNamed:item.rightIcon];
   
   
}
-(void)coustomTitleWithImage{
    
    if (self.items.icon) {
        self.title_image.image=[UIImage imageNamed:self.items.icon];
    }
    self.titile_label.text=self.items.title;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
