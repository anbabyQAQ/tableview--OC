//
//  CardPortraitCell.m
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "CardPortraitCell.h"
#import "UIView+TYL.h"
#import "TYLCommonTableData.h"
#import "TYLUserInfo.h"
#import "TYLDataManager.h"
#import "UIImageView+WebCache.h"


@interface CardPortraitCell()

@property (nonatomic,strong) TYLCommonTableRow *rowData;

@end

@implementation CardPortraitCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self initialize];
    }
    return self;
}
- (void)initialize {
    
    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.font = [UIFont systemFontOfSize:16.f];
    self.leftLabel.textColor = [UIColor blackColor];
    self.leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.font = [UIFont systemFontOfSize:14.f];
    self.rightLabel.textColor = [UIColor blackColor];
    self.rightLabel.textAlignment= NSTextAlignmentLeft;
    self.rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.rightImageView = [[UIImageView alloc] init];
    self.rightImageView.image = [UIImage imageNamed:@"员工"];
    self.rightImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self addSubview:self.leftLabel];
    [self addSubview:self.rightLabel];
    [self addSubview:self.rightImageView];
    
    
    //在cell上加一个控件看一下事件的处理
    _button = [[UIButton alloc] initWithFrame:CGRectZero];
    _button.tyl_size = CGSizeMake(self.tyl_width - 20, 45);
    _button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:_button];
    
}

- (void)refreshData:(TYLCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.rowData = rowData;

    
    //添加控件的响应事件
    [self.button setTitle:rowData.title forState:UIControlStateNormal];
    [self.button removeTarget:tableView.tyl_viewController action:NULL forControlEvents:UIControlEventTouchUpInside];
    if (rowData.cellActionName.length) {
        SEL action = NSSelectorFromString(rowData.cellActionName);
        [_button addTarget:tableView.tyl_viewController action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    //数据赋值
    NSString *uid = rowData.extraInfo;
    if ([uid isKindOfClass:[NSString class]]) {
        TYLUserInfo *user = [[TYLDataManager shareManager] currentUserInfoWithUserId:uid];
        self.leftLabel.text = user.name;
        self.rightLabel.text = user.QQ;
        
        if (user.portraitUri != nil) {
            if ([user.portraitUri hasPrefix:@"http"] || [user.portraitUri hasPrefix:@"file:"]) {
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:user.portraitUri] placeholderImage:[UIImage imageNamed:@"员工"]];
            } else {
                self.rightImageView.image = [UIImage imageNamed:@"员工"];
            }
        }
    }
    
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect buttonRect = self.button.frame;
    if(CGRectContainsPoint(buttonRect, point)){
        return self;
    }
    return [super hitTest:point withEvent:event];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _button.tyl_centerX = self.tyl_width * .5f;
    _button.tyl_centerY = self.tyl_height * .5f;
    
    _rightImageView.tyl_size    = CGSizeMake(58, 58);
    _rightImageView.tyl_centerX = self.tyl_left + 58/2 +15;
    _rightImageView.tyl_centerY = self.tyl_top  + 58/2 +5 ;
    
    _leftLabel.tyl_size    = CGSizeMake(self.tyl_width/2, 20);
    _leftLabel.tyl_left = _rightImageView.tyl_right + 10;
    _leftLabel.tyl_top = _rightImageView.tyl_top   + 10;
    
    _rightLabel.tyl_size   = CGSizeMake(self.tyl_width/2, 20);
    _rightLabel.tyl_left = _rightImageView.tyl_right + 10;
    _rightLabel.tyl_top = _leftLabel.tyl_bottom   + 5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [_button setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [_button setHighlighted:highlighted];
}

@end
