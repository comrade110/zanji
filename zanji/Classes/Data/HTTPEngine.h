//
//  HTTPEngine.h
//  zanji
//
//  Created by xiang-chen on 15/8/28.
//  Copyright (c) 2015年 chx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HTTPEngine : AFHTTPSessionManager

+(instancetype)instance;

+ (void)saveCookies;
+ (void)loadCookies;
+ (void)deleteCookies;

@end
