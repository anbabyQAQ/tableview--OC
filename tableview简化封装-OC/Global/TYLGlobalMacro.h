//
//  TYLGlobalMacro.h
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#ifndef TYLGlobalMacro_h
#define TYLGlobalMacro_h


#define TYLKit_UIScreenWidth   [UIScreen mainScreen].bounds.size.width
#define TYLKit_UIScreenHeight  [UIScreen mainScreen].bounds.size.height



#pragma mark - UIColor宏定义

#define TYLKit_UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]



#define TYLKit_SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* TYLGlobalMacro_h */
