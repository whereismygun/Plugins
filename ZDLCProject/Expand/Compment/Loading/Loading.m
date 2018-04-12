//
//  Loading.m
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//

#import "Loading.h"
#import "UIImage+GIF.h"

@interface Loading()

@property (nonatomic,strong)UIImageView *image;

@end
@implementation Loading

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        _image=[[UIImageView alloc]init];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"loading" ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        _image.image = [UIImage sd_animatedGIFWithData:data];
        
        
        [self addSubview:_image];
        
    }
    return self;
}

+(void)showLoadingInSubView:(UIView*)view{
    
    Loading *loading = [[self alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    loading.backgroundColor=[UIColor whiteColor];
    BOOL isShow=NO;
    
    NSEnumerator *subviewEnum = [view.subviews reverseObjectEnumerator];
    for (UIView*subview in subviewEnum) {
        if ([subview isKindOfClass:[loading class]]) {
            isShow=YES;
        }
    }
    if (!isShow) {
        [view addSubview:loading];
    }
}

+ (void)hideLoadingInsubView:(UIView*)view{
    Loading*loading= [self getSelfWith:view];
    if (loading != nil) {
        [loading removeFromSuperview];
    }
    
}


+(Loading*)getSelfWith:(UIView*)view{
    NSEnumerator *subviewEnum = [view.subviews reverseObjectEnumerator];
    for (UIView*subview in subviewEnum) {
        if ([subview isKindOfClass:self]) {
            return (Loading*)subview;
        }
    }
    return nil;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
}

@end
