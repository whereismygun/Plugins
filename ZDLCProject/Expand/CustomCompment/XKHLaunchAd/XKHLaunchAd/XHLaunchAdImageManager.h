//
//  xkh
//
//  Created by apple on 2017/4/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHLaunchAdDownloader.h"


typedef NS_OPTIONS(NSUInteger, XHLaunchAdImageOptions) {
    
    /**
     *  有缓存,读取缓存,不重新加载,没缓存先加载,并缓存
     */
    XHLaunchAdImageDefault = 1 << 0,
    
    /**
     *  只加载,不缓存
     */
    XHLaunchAdImageOnlyLoad = 1 << 1,
    
    /**
     *  先读缓存,再加载刷新图片和缓存
     */
    XHLaunchAdImageRefreshCached = 1 << 2 ,
    
    /**
     *  后台缓存本次不显示,缓存OK后下次再显示
     */
    XHLaunchAdImageCacheInBackground = 1 << 3
    
};

typedef void(^XHExternalCompletionBlock)(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL);

@interface XHLaunchAdImageManager : NSObject

+(nonnull instancetype )sharedManager;

- (void)loadImageWithURL:(nullable NSURL *)url options:(XHLaunchAdImageOptions)options progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHExternalCompletionBlock)completedBlock;

@end
