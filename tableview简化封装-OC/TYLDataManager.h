//
//  TYLDataManager.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYLUserInfo.h"

@interface TYLDataManager : NSObject

+(TYLDataManager *) shareManager;

-(void)syncFriendList:(void (^)(NSMutableArray* friends,BOOL isSuccess))completion;

-(TYLUserInfo *)currentUserInfoWithUserId:(NSString *)userId;

@end
