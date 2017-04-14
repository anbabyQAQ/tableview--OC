//
//  CardPortraitCell.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYLCommonTableViewCell.h"

@interface CardPortraitCell : UITableViewCell<TYLCommonTableViewCell>


@property(nonatomic, strong) UILabel *leftLabel;

@property(nonatomic, strong) UILabel *rightLabel;

@property(nonatomic, strong) UIImageView *rightImageView;

@property(nonatomic, strong) UIButton    *button;

@end
