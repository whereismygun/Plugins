//
//  AdModel.m
//  xkh
//
//  Created by apple on 2017/4/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "AdModel.h"

@implementation AdModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
  self = [super init];
  if (self) {
    
    self.content = dict[@"content"];
    self.openUrl = dict[@"openUrl"];
    self.duration = [dict[@"duration"] integerValue];
    self.contentSize = @"1242*1786";
  }
  return self;
}

-(CGFloat)width
{
  return [[[self.contentSize componentsSeparatedByString:@"*"] firstObject] floatValue];
}
-(CGFloat)height
{
  return [[[self.contentSize componentsSeparatedByString:@"*"] lastObject] floatValue];
}
@end
