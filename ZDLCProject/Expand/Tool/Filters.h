//
//  Filters.h
//  ttl
//
//  Created by why on 2017/12/11.
//  Copyright © 2017年 why. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filters : NSObject

+ (BOOL)validateMobile:(NSString *)mobile;

+(id)keepfixed:(id)b;


+(NSString*)timeUnitStatus:(NSString*)d;

+(NSString*)removeFloatAllZero:(NSString*)string;

+(NSString*)financeStatus:(NSString*)d;

+(NSString*)percentage:(NSString*)d;


+(NSString*)scheduleType:(NSString*)d;

+(NSString*)timeCycle:(NSString*)d;

+(NSString *)seperateNumberByComma:(NSString*)number isInt:(BOOL)isInt;

+(NSString *)billStatus:(NSString*)d;


//** 还款计划过滤器 */
+(NSString*)scheduleStatus:(NSString*)d;



@end
