//
//  EmptyData.m
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//

#import "EmptyData.h"


@interface EmptyData()

@property (nonatomic,strong)UIImageView*imageContent;
@property (nonatomic,strong)UILabel*des;


@end

@implementation EmptyData


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        _imageContent=[[UIImageView alloc]init];
        _imageContent.image=[UIImage imageNamed:@"noData"];
        _des=[[UILabel alloc]init];
        _des.text=@"暂无数据";
        _des.font=[UIFont systemFontOfSize:14*SizeScale];
        
        _des.textColor=[UIColor colorWithHexString:baseTextColor2];
        
        [self addSubview:_imageContent];
        [self addSubview:_des];
        
        
    }
    return self;
}


+(void)showNoDataInSubView:(UIView*)view{
    
    
    EmptyData*nodata=[[self alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    BOOL isShow=NO;
    
    NSEnumerator *subviewEnum = [view.subviews reverseObjectEnumerator];
    for (UIView*subview in subviewEnum) {
        if ([subview isKindOfClass:[nodata class]]) {
            isShow=YES;
        }
    }
    if (!isShow) {
        [view addSubview:nodata];
    }
    
}

+(void)hideNoDataInsubView:(UIView*)view{
    
    EmptyData*nodata = [self getSelfWith:view];
    if (nodata != nil) {
        [nodata removeFromSuperview];
    }
}

+(EmptyData*)getSelfWith:(UIView*)view{
    
    NSEnumerator *subviewEnum = [view.subviews reverseObjectEnumerator];
    for (UIView*subview in subviewEnum) {
        if ([subview isKindOfClass:self]) {
            return (EmptyData*)subview;
        }
    }
    return nil;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_imageContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_imageContent.mas_bottom).offset(20);
        
    }];
    
}


@end
