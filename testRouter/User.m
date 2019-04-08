//
//  User.m
//  testRouter
//
//  Created by PanJinMing on 2019/2/26.
//  Copyright © 2019 iwm. All rights reserved.
//

#import "User.h"
@interface UserBuild()

@end

@implementation UserBuild
- (User *)build {
    return [[User alloc]initWithBuild:self];
}
@end

@interface User()

@end

@implementation User
- (instancetype)initWithBuild:(UserBuild *)build {
    if (self = [super init]) {
        self.name = build.name;
    }
    return self;
}

+ (instancetype)buildWithblock:(void (^)(UserBuild *build))block {
    UserBuild *build = [[UserBuild alloc] init];
    block(build);
    return  [build build];
}


- (void)testChange {
    NSLog(@"chifanle ");
}

@end
