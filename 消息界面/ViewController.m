//
//  ViewController.m
//  消息界面
//
//  Created by David on 16/6/14.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "ViewController.h"
#import "PDMessageTableViewCell1.h"
#import "PDMessageTableViewCell2.h"
#import "PDMessageModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"
static NSString *cellID1 = @"cell1";
static NSString *cellID2 = @"cell2";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *modelsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self creatModelsWithCount:5];
}

- (void)configUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self.tableView registerClass:[PDMessageTableViewCell1 class] forCellReuseIdentifier:cellID1];
    [self.tableView registerClass:[PDMessageTableViewCell2 class] forCellReuseIdentifier:cellID2];
    [self.view addSubview:self.tableView];
}

- (void)creatModelsWithCount:(NSInteger)count
{
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    NSArray *timeArray = @[
                           @"2016-06-05",
                           @"2016-06-06",
                           @"2016-06-07",
                           @"2016-06-08",
                           @"2016-06-09",
                           ];
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的LaunchImage 时。然后等比例拉伸",
                           @"然后等比例拉伸到大屏。屏幕宽度返回 320否则在大屏上会显得字大",
                           @"长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。"
                           ];
    NSArray *titleArray = @[@"鸣人",
                            @"佐助",
                            @"小樱",
                            @"大蛇丸",
                            @"卡卡西"
                            ];
    
    for (int i = 0; i < count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        
        PDMessageModel *model = [PDMessageModel new];
        model.title = titleArray[nameRandomIndex];
        
        
        // 模拟“有或者无图片”
        model.content = textArray[iconRandomIndex];
        model.iconUrl = iconImageNamesArray[iconRandomIndex];
        model.time = timeArray[iconRandomIndex];
        [self.modelsArray addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PDMessageTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cellID2];
    cell.model = self.modelsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class currentClass = [PDMessageTableViewCell2 class];
    
    PDMessageModel *model = self.modelsArray[indexPath.row];

    /*
     普通版也可实现一步设置搞定高度自适应，不再推荐使用此套方法，具体参看“UITableView+SDAutoTableViewCellHeight”头文件
     return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:currentClass];
     */
    
    // 推荐使用此普通简化版方法（一步设置搞定高度自适应，性能好，易用性好）
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:currentClass contentViewWidth:[self cellContentViewWith]] + 10;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (NSMutableArray *)modelsArray
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
    }
    return _modelsArray;
}

@end
