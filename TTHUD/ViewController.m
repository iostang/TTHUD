//
//  ViewController.m
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "ViewController.h"
#import "TTHelper.h"

#define kSuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

static NSString * const kHUDTitle_SelectedBrand              = @"请选择品牌";
static NSString * const kHUDTitle_SelectedGoodsSpecification = @"请选择商品属性规格";
static NSString * const kHUDTitle_AddDetailDescription       = @"请添加详细描述";
static NSString * const kHUDTitle_SelectedIsNew              = @"请选择是否全新";
static NSString * const kHUDTitle_NoTitleNoCan               = @"没有标题怎么行";
static NSString * const kHUDTitle_NoMoneyNoBB                = @"不能不谈价格哦";
static NSString * const kHUDTitle_PostageCannotBeZero        = @"邮费不能为零哦";
static NSString * const kHUDTitle_ClearCaChe                 = @"缓存清理成功";
static NSString * const kHUDTitle_FocusSuccess               = @"关注成功";
static NSString * const kHUDTitle_CommentSuccess             = @"添加评论成功";
static NSString * const kHUDTitle_Loading                    = @"Loading";
static NSString * const kHUDTitle_NetworkVeryBad             = @"网络有点慢，好心塞";

static NSString *const kCellIdentifier = @"cellIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.513 green:0.652 blue:1.000 alpha:1.000];
 
    
    self.dataSource = @[@"network",@"center",@"bottom",@"loading",@"success",@"error",@"custom_bottom",@"stop"].mutableCopy;
    
    
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    
    
}

#pragma mark - UITableView Datasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   kSuppressPerformSelectorLeakWarning([self performSelector:NSSelectorFromString(self.dataSource[indexPath.row])]);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)bottom
{
    [TTHelper showRightHUDToViewBottom:self.view message:kHUDTitle_CommentSuccess];
}

- (void)network
{
    [TTHelper showNetworkToView:self.view];
}

- (void)center
{
    [TTHelper showHUDToViewCenter:self.view message:kHUDTitle_NoMoneyNoBB];
}

- (void)success
{
    [TTHelper showSuccessHUDToView:self.view message:@"支付成功"];
}

- (void)error
{
    [TTHelper showErrorHUDToView:self.view message:@"支付失败"];
}

- (void)stop
{
    [TTHelper hideLoadingFromView:self.view];
}

- (void)loading
{
    [TTHelper showLoadingToView:self.view];
}

- (void)custom_bottom
{
    [TTHelper showHUDToViewBottom:self.view message:@"自定义Bottom位置" position:(CGPoint){50,-220}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
