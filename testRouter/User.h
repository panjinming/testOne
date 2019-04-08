//
//  User.h
//  testRouter
//
//  Created by PanJinMing on 2019/2/26.
//  Copyright © 2019 iwm. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UserBuild:NSObject
@property (nonatomic, copy) NSString *name;
@end


@interface User : NSObject
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithBuild:(UserBuild *)build;
+ (instancetype)buildWithblock:(void (^)(UserBuild *build))block;
@end


