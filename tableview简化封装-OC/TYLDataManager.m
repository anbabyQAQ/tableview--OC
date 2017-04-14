//
//  TYLDataManager.m
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "TYLDataManager.h"
#import "TYLUserInfo.h"
#import "AppDelegate.h"

@implementation TYLDataManager{
    NSMutableArray *dataSoure;
}

- (instancetype)init{
    if (self = [super init]) {
        //
    }
    return self;
}

+ (TYLDataManager *)shareManager{
    static TYLDataManager* manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

-(void)syncFriendList:(void (^)(NSMutableArray* friends,BOOL isSuccess))completion
{
    dataSoure = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 1; i<7; i++) {
        if(i==1){
            TYLUserInfo *aUserInfo =[[TYLUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"安狗蛋" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151210/1449727866527.jpg" QQ:@"888888888" sex:@"男"];
            [dataSoure addObject:aUserInfo];
        }else if (i==2) {
            TYLUserInfo *aUserInfo =[[TYLUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"吴狗蛋" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151210/1449727755947.jpg" QQ:@"44444444" sex:@"女"];
            [dataSoure addObject:aUserInfo];
        }else if(i==3){
            TYLUserInfo *aUserInfo =[[TYLUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"天大帅哥" portrait:@"http://pic.ihk.cn/head/base/ihk/2014/04/30/213816839.jpg" QQ:@"9999999999" sex:@"男"];
            [dataSoure addObject:aUserInfo];
            
        }else if(i==4){
            TYLUserInfo *aUserInfo =[[TYLUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"孙小帅哥" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151218/1450420944608.jpg" QQ:@"4231231312" sex:@"男"];
            [dataSoure addObject:aUserInfo];
            
        }else if(i==5){
            TYLUserInfo *aUserInfo =[[TYLUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"安大漂亮" portrait:@"http://pic.ihk.cn/head/80_93/ihk/2015/05/20/104331022.jpg" QQ:@"213321123321" sex:@"女"];
            [dataSoure addObject:aUserInfo];
            
        }
    }
    
    [AppDelegate shareAppDelegate].friendsArray = dataSoure;
    completion(dataSoure,YES);
    
}

-(TYLUserInfo *)currentUserInfoWithUserId:(NSString *)userId{
    for (NSInteger i = 0; i<[AppDelegate shareAppDelegate].friendsArray.count; i++) {
        TYLUserInfo *aUser = [AppDelegate shareAppDelegate].friendsArray[i];
        
        if ([userId caseInsensitiveCompare:aUser.userId] == NSOrderedSame) {
            return aUser;
        }
    }
    return nil;
}

@end
