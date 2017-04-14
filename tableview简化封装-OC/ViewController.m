//
//  ViewController.m
//  tableview简化封装-OC
//
//  Created by tyl on 2017/4/14.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "ViewController.h"
#import "TYLCommonTableDelegate.h"
#import "TYLGlobalMacro.h"
#import "TYLCommonTableData.h"
#import "TYLDataManager.h"
#import "TYLUserInfo.h"
#import "UIView+TYL.h"

@interface ViewController ()

@property (nonatomic,strong) TYLCommonTableDelegate *delegate;

@property (nonatomic,copy  ) NSArray                 *data;

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"好友列表";
    
    
    //代理初始化
    __weak typeof(self) wself = self;
    self.delegate = [[TYLCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return wself.data;
    }];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = TYLKit_UIColorFromRGBA(0xe3e6ea, 1.0);
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate   = self.delegate;
    self.tableView.dataSource = self.delegate;
    
    [self buildData1];

}

- (void)buildData{
    
    [[TYLDataManager shareManager] syncFriendList:^(NSMutableArray *friends, BOOL isSuccess) {
        //在appdelegate中 已经对模拟数据进行了模型本地化 ，所以在这不进行数据模型化了
        if (isSuccess) {
            
            NSMutableArray *datasource = [NSMutableArray new];
            
            for (TYLUserInfo *user in friends) {
                NSDictionary *dict = @{
                                       HeaderTitle:@"",
                                       RowContent :@[
                                               @{
                                                   ExtraInfo     : user.userId.length ? user.userId : [NSNull null],
                                                   CellClass     : @"CardPortraitCell",
                                                   RowHeight     : @(40),
                                                   CellAction   : @"chat",
                                                   Disable      : @(NO),
                                                   ForbidSelect : @(YES),
                                                   SepLeftEdge  : @(self.view.tyl_width),
                                                   },
                                               ],
                                       FooterTitle:@"",
                                       };
                [datasource addObject:dict];
                
            }
            self.data = [TYLCommonTableSection sectionsWithData:datasource];
            [self.tableView reloadData];

        }
    }];
  
}


- (void)buildData1{
    
    [[TYLDataManager shareManager] syncFriendList:^(NSMutableArray *friends, BOOL isSuccess) {
        //在appdelegate中 已经对模拟数据进行了模型本地化 ，所以在这不进行数据模型化了
        if (isSuccess) {
           
            NSMutableArray *arr = [NSMutableArray new];
            for (TYLUserInfo *user in friends) {
                NSDictionary *dic = @{
                                      ExtraInfo     : user.userId.length ? user.userId : [NSNull null],
                                      CellClass     : @"CardPortraitCell",
                                      RowHeight     : @(40),
                                      CellAction   : @"chat",
                                      Disable      : @(NO),
                                      ForbidSelect : @(YES),
                                      SepLeftEdge  : @(self.view.tyl_width),
                                      };
                [arr addObject:dic];
            }
            
            NSMutableArray *datasource = [NSMutableArray new];
            NSDictionary *dict = @{
                                   HeaderTitle:@"",
                                   HeaderHeight:@(0),
                                   FooterHeight:@(0),
                                   RowContent :arr,
                                   FooterTitle:@"",
                                   };
            [datasource addObject:dict];
            
            self.data = [TYLCommonTableSection sectionsWithData:datasource];
            [self.tableView reloadData];
            
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
