//
//  Dimensions.h
//  ZDLC
//
//  Created by why on 2018/4/8.
//  Copyright © 2018年 why. All rights reserved.
//


#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width

#define NGBAR_HEIGHT 64
#define TABBAR_HEIGHT 98

#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;

#define Content_Bounds CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT)

#define SizeScale ((SCREEN_WIDTH == 375) ? 1 : SCREEN_HEIGHT/667)

#define SizeWidth(W)  W * SCREEN_WIDTH/375
#define SizeHeight(H) H * SCREEN_HEIGHT/667

#define RectMake(x,y,w,h) CGRectMake(SizeWidth(x), ImgHeight(y), SizeWidth(w), ImgHeight(h))

#define ImgHeight(H) (kDevice_Is_iPhoneX ? H : H * SCREEN_HEIGHT/667)


