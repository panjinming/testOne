//
//  MJRouters.h
//  testRouter
//
//  Created by PanJinMing on 2017/11/22.
//  Copyright © 2017年 iwm. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString * const ParagramUrl;
extern NSString *const ParagramCompletetion;
extern NSString *const ParagramUserInfo;
typedef void(^MJHander) (NSDictionary *routeParagma);

typedef id(^MJObjHandler) (NSDictionary *routeParagma);


@interface MJRouters : NSObject
+(void)registerUrlParagma:(NSString *)pattern toHandler:(MJHander)handler;

+(void)registerUrlParagma:(NSString *)pattern toHander:(MJObjHandler)objHandler;

+(void)deregisterUrlPattern:(NSString *)UrlPattern;

+(void)openUrl:(NSString *)url;

+(void)openUrl:(NSString *)url complete:(void(^)(id result))completion;

+(void)openUrl:(NSString *)url withDic:(NSDictionary *)userInfo completion:(void(^)(id result))completion;


+(id)objectForUrl:(NSString *)url;

+(id)objectForUrl:(NSString *)url withDic:(NSDictionary *)userInfo ;

+(BOOL)canOpenUrl:(NSString *)url;

+(NSString *)gennerateUrlwithPattern:(NSString *)pattern paragmas:(NSDictionary *)paragmas;


@end
