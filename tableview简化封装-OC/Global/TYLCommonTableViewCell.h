//
//  TYLCommonTableViewCell.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYLCommonTableRow;

@protocol TYLCommonTableViewCell <NSObject>


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


/**
 自定义cell ，实现代理方法 进行tableview的数据处理及刷新
 */
@optional
- (void)refreshData:(TYLCommonTableRow *)rowData tableView:(UITableView *)tableView;

@end
