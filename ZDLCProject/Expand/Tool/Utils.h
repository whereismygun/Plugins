//
//  Utils.h
//  ttl
//
//  Created by why on 2017/12/12.
//  Copyright © 2017年 why. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject


+ (NSString*)getCurrentTimestamp;

+ (NSString *)md5:(NSString *)string;


+ (BOOL) IsIdentityCard:(NSString *)IDCardNumber;

+ (BOOL) IsPhoneNumber:(NSString *)number;

+ (BOOL) IsBankCard:(NSString *)cardNumber;


+ (NSString *)htmlEntityDecode:(NSString *)string;


+ (NSString*)getCacheSize;

+ (void)cleanCache;

+ (UIViewController*)getCurrentVC;

@end
