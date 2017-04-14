//
//  UIView+TYL.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TYL)

@property (nonatomic) CGFloat tyl_left;

/**
 * 捷径取 frame.origin.y
 *
 * 设置 frame.origin.y = top
 */
@property (nonatomic) CGFloat tyl_top;

/**
 * 捷径取 frame.origin.x + frame.size.width
 *
 * 设置 frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat tyl_right;

/**
 * 捷径取 for frame.origin.y + frame.size.height
 *
 * 设置 frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat tyl_bottom;

/**
 * 捷径取 for frame.size.width
 *
 * 设置 frame.size.width = width
 */
@property (nonatomic) CGFloat tyl_width;

/**
 * 捷径取 for frame.size.height
 *
 * 设置 frame.size.height = height
 */
@property (nonatomic) CGFloat tyl_height;

/**
 * 捷径取 for center.x
 *
 * 设置 center.x = centerX
 */
@property (nonatomic) CGFloat tyl_centerX;

/**
 * 捷径取 for center.y
 *
 * 设置 center.y = centerY
 */
@property (nonatomic) CGFloat tyl_centerY;

/**
 * 捷径取 for frame.origin
 */
@property (nonatomic) CGPoint tyl_origin;

/**
 * 捷径取 for frame.size
 */
@property (nonatomic) CGSize tyl_size;

//找到自己的vc
- (UIViewController *)tyl_viewController;


@end
