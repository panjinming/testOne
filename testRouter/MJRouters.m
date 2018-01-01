//
//  MJRouters.m
//  testRouter
//
//  Created by PanJinMing on 2017/11/22.
//  Copyright © 2017年 iwm. All rights reserved.
//

#import "MJRouters.h"
#import <objc/runtime.h>
static NSString *const MGJ_ROUTER_WILDCARD_CHARACTER = @"~";
static NSString *specialCharater = @"/?&.";

NSString * const ParagramUrl = @"ParagramUrl";
NSString *const ParagramCompletetion = @"ParagramCompletetion";
NSString *const ParagramUserInfo = @"ParagramUserInfo";

@interface MJRouters()
@property (nonatomic)NSMutableDictionary *routes;
@end

@implementation MJRouters
+(instancetype)shareInstance{
    static MJRouters *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(NSMutableDictionary *)routes{
    if (!_routes) {
        _routes = [[NSMutableDictionary alloc] init];
    }
    return _routes;
}


+(BOOL)checkSpecial:(NSString *)str{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:specialCharater];;
    return  [str rangeOfCharacterFromSet:set].location != NSNotFound;
}



+(void)registerUrlParagma:(NSString *)pattern toHandler:(MJHander)handler{
    
    [[self shareInstance] addPatternUrl:pattern tohandler:handler];
    
}

-(void)addPatternUrl:(NSString *)pattern tohandler:(MJHander)handler{
    NSMutableDictionary *dic = [self adPattern:pattern];
    if (dic && handler) {
        dic[@"_"] = [handler copy];
    }
    
}

-(NSMutableDictionary *)adPattern:(NSString *)pattern{
    NSArray *pathCompents = [self pathCompent:pattern];
    NSMutableDictionary *subRoute = self.routes;
    for (NSString *segment in pathCompents) {
        if (![subRoute objectForKey:segment]) {
            subRoute[segment] = [NSMutableDictionary dictionary];
        }
        subRoute = subRoute[segment];
    }
    return subRoute;
}

-(NSArray *)pathCompent:(NSString *)url{
    NSMutableArray *mupattern = [NSMutableArray array];

    //取出协议, 协议后面内容赋值给url
    if([url rangeOfString:@"//"].location != NSNotFound){
        NSArray *pathSegments = [url componentsSeparatedByString:@"://"];
        [mupattern addObject:pathSegments[0]];

        //如果只有协议,放进占位符
        url = pathSegments.lastObject;
        if (!url.length){
            [mupattern addObject:MGJ_ROUTER_WILDCARD_CHARACTER];
        }
    }


    //处理//后面内容
    for (NSString *pathCompent in [[NSURL URLWithString:url] pathComponents]) {
        if ([pathCompent isEqualToString:@"/"]) continue;
        if ([[pathCompent substringToIndex:1] isEqualToString:@"?"]) break;
        [mupattern addObject:pathCompent];
    }

    return mupattern.copy;
}


+(void)deregisterUrlPattern:(NSString *)UrlPattern{
    [[self shareInstance] removeURLPattern:UrlPattern];
}

-(void)removeURLPattern:(NSString *)URLPattern{
    NSMutableArray *pathCompents = [NSMutableArray arrayWithArray:[self pathCompent:URLPattern]];
    if (pathCompents.count >= 1) {
        NSString *compents = [pathCompents componentsJoinedByString:@"."];
        NSMutableDictionary *route  =  [self.routes valueForKey:compents];
        
        if (route.count >= 1) {
            NSString *lastCompent = [pathCompents lastObject];
            [pathCompents removeLastObject];
            
            route = self.routes;
            if (pathCompents.count) {
                NSString *compentWithoutlast = [pathCompents componentsJoinedByString:@"."];
                route = [self.routes valueForKeyPath:compentWithoutlast];
            }
            [route removeObjectForKey:lastCompent];
        }
    }
    
}


@end
