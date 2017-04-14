//
//  TYLCommonTableDelegate.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYLCommonTableDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>

/**
 初始化tableview代理，并返还数据进行操作

 @param data 表单数据
 @return 代理实例对象
 */
- (instancetype)initWithTableData:(NSArray *(^)(void))data;

/**
 分割线距左边距
 */
@property (nonatomic,assign) CGFloat defaultSeparatorLeftEdge;


@end
