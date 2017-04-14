//
//  TYLUserInfo.m
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "TYLUserInfo.h"

@implementation TYLUserInfo

- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)username portrait:(NSString *)portrait QQ:(NSString *)QQ sex:(NSString *)sex{
    if (self = [super init]) {
        self.userId        =   userId;
        self.name          =   username;
        self.portraitUri   =   portrait;
        self.QQ         =   QQ;
        self.sex   =   sex;
        
    }
    return self;
}

@end
