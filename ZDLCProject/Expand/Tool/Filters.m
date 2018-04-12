//
//  Filters.m
//  ttl
//
//  Created by why on 2017/12/11.
//  Copyright © 2017年 why. All rights reserved.
//

#import "Filters.h"

@implementation Filters




+ (BOOL)validateMobile:(NSString *)mobile
{
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+(id)keepfixed:(id)b{
    
    if (!b) {
        return 0;
    }
    return b;
}

+(NSString*)timeUnitStatus:(NSString*)d{
    
    if (d) {
        if ([d isEqualToString:@"day"]) return @"天";
        if ([d isEqualToString:@"month"]) return @"个月";
        if ([d isEqualToString:@"year"]) return @"年";
    }
    return d;
}

+(NSString*)financeStatus:(NSString*)d{
    if (d) {
        if ([d isEqualToString:@"new_p"]) return @"新人专享";
        if ([d isEqualToString:@"hot"]) return @"热门标";
        if ([d isEqualToString:@"earn_double"]) return @"双倍收益";
    }
    return d;
    
}

+(NSString*)scheduleStatus:(NSString*)d{
    if (d) {
        if ([d isEqualToString:@"wait_to_receive"])return @"等待回款";
        if ([d isEqualToString:@"invest_finished"])return @"已回款";
    }
    return d;
}

+(NSString*)percentage:(NSString*)d{
    if ([d isEqualToString:@""]) {
        return @"0%";
    }
    NSString *p = [NSString stringWithFormat:@"%0.2f%%",[d floatValue]*100];
    
    NSString * per= [NSString stringWithFormat:@"%@%%",[self removeFloatAllZero:p]];
    
    return per;
}



+(NSString*)seperateNumberByComma:(NSString*)number isInt:(BOOL)isInt{
    
    if ([number isEqualToString:@"0"] || number ==nil) {
        return @"0.00";
    }
      NSString *numStr ;
    
      NSInteger countInt ;
    
    if (isInt) {
        countInt=0;
        numStr = [NSString stringWithFormat:@"%d",[number intValue]];
       }else{
        countInt=3;
        numStr = [NSString stringWithFormat:@"%0.2f",[number doubleValue]];
       }
    
        NSInteger length = numStr.length-countInt;
        NSInteger count = numStr.length/3;
    
        for (int i=1; i<=count; i++) {
    
            NSInteger location = length - i*3;
            if (location <= 0) {
                break;
            }

            numStr = [numStr stringByReplacingCharactersInRange:NSMakeRange(location, 0) withString:@","];
        }
    
        return numStr;
    
}




+(NSString*)removeFloatAllZero:(NSString*)string
{
    
    NSString * testNumber = string;
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    
    //    价格格式化显示
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    NSString *formatterString = [formatter stringFromNumber:[NSNumber numberWithFloat:[outNumber doubleValue]]];
    
    NSRange range = [formatterString rangeOfString:@"."]; //现获取要截取的字符串位置

    
    if (range.length>0) {
        
        NSString * result = [formatterString substringFromIndex:range.location]; //截取字符串
        
        if (result.length>=4) {
            
            formatterString=[formatterString substringToIndex:formatterString.length-1];
        }
        
    }
 
    return formatterString;
}

+(NSString*)scheduleType:(NSString*)d{
    
    if(d){
        if ([d isEqualToString:@"acpi"]) return @"等额本息";
        if ([d isEqualToString:@"aecl"])return @"等额本金";
        if ([d isEqualToString:@"fiaa"]) return @"先息后本";
        if ([d isEqualToString:@"epei"])return @"等本等息";
        if ([d isEqualToString:@"mopai"]) return @"到期还本付息";
    }
    return d;
}

+(NSString*)timeCycle:(NSString*)d{
    
    if ([d isEqualToString:@""] || [d isEqualToString:@"0"]) {
        return @"暂无";
    }else{
        return [NSString stringWithFormat:@"%@个月",d];
    }

    
}

+(NSString*)billStatus:(NSString *)d{
    
    if (![d isEqualToString:@""]) {
         if ([d isEqualToString:@"success"]) return @"已完成";
         if ([d isEqualToString:@"wait_confirmed"]) return @"处理中";
         if ([d isEqualToString:@"failed"]) return @"交易失败";
    }
    return d;
}
@end
