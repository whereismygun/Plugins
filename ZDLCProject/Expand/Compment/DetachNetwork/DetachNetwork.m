//
//  DetachNetwork.m
//  ttl
//
//  Created by why on 2018/3/5.
//  Copyright © 2018年 why. All rights reserved.
//

#import "DetachNetwork.h"
#import "UIResponder+Router.h"

@implementation DetachNetwork

- (IBAction)reloadNetwork:(id)sender {
    [self.nextResponder routerEventWithName:@"reloadNetwork" userInfo:nil];
}
@end
