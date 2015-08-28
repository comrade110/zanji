//
//  HTTPEngine.m
//  zanji
//
//  Created by xiang-chen on 15/8/28.
//  Copyright (c) 2015年 chx. All rights reserved.
//

#import "HTTPEngine.h"
#import "AFNetworking.h"
#import <AdSupport/AdSupport.h>


@implementation HTTPEngine


+(instancetype)instance{

    static HTTPEngine *_engine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _engine = [[HTTPEngine alloc] initWithBaseURL:[NSURL URLWithString:nil]];
        _engine.requestSerializer = [AFHTTPRequestSerializer serializer];
        _engine.responseSerializer = [AFHTTPResponseSerializer serializer];
        [[self.class httpheaders] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [_engine.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    });
    
    return _engine;
}



+(NSDictionary*)httpheaders{
    
    NSDictionary *headers = @{
                              @"platForm":@"iOS",
                              @"clientVersion":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
                              @"deviceNo":[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString],
                              @"mobileModel":[UIDevice currentDevice].model,
                              @"sysVersion":[UIDevice currentDevice].systemVersion,
                              @"scale":@([UIScreen mainScreen].scale)
                              };

    return headers;

}

-(NSURLSessionDataTask*)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    [HTTPEngine loadCookies];
    return [[HTTPEngine instance] POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [HTTPEngine saveCookies];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }]; 
}


+ (void)saveCookies{
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: @"sessionCookies"];
    [defaults synchronize];
    
}

//每次请求之前获取Cookie,请求数据成功之后保存Cookie,退出登录的时候删除deleteCookies.
+ (void)loadCookies{
    
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"sessionCookies"]];//归档
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in cookies) {
        [cookieStorage setCookie: cookie];
    }
    
}

+(void)deleteCookies{
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"sessionCookies"]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in cookies){
        [cookieStorage deleteCookie:cookie];
    }
}


@end
