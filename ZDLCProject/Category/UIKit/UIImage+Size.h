//
//  UIImage+Size.h
//  ttl
//
//  Created by why on 2018/1/3.
//  Copyright © 2018年 why. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Size)

-(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

-(UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

@end
