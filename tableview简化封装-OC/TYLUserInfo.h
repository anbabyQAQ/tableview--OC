//
//  TYLUserInfo.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYLUserInfo : NSObject


/** 用户ID */
@property(nonatomic, strong) NSString *userId;
/** 用户名*/
@property(nonatomic, strong) NSString *name;
/** 头像URL*/
@property(nonatomic, strong) NSString *portraitUri;
/** QQ*/
@property(nonatomic, strong) NSString *QQ;

/** sex*/
@property(nonatomic, strong) NSString *sex;


- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)username portrait:(NSString *)portrait QQ:(NSString *)QQ sex:(NSString *)sex;

@end
