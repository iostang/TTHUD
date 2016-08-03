//
//  ViewController.m
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "ViewController.h"
#import "TTHelper.h"



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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.513 green:0.652 blue:1.000 alpha:1.000];
    
    UIButton *btnTop1 = ({
        UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(20, 20, 50, 50);
        [btn addTarget:self action:@selector(top) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Top" forState:UIControlStateNormal];
        btn;
    });
    
    
    UIButton *btnBom = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(120, 20, 50, 50);
        [btn addTarget:self action:@selector(center) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Cen" forState:UIControlStateNormal];
        btn;
    });
    
    UIButton *btnTop2 = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(20, 80, 50, 50);
        [btn addTarget:self action:@selector(bom) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Bom" forState:UIControlStateNormal];
        btn;
    });
    
    UIButton *btnTop3 = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(120, 80, 50, 50);
        [btn addTarget:self action:@selector(loading) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Load" forState:UIControlStateNormal];
        btn;
    });

    UIButton *btnTop5 = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(200, 80, 50, 50);
        [btn addTarget:self action:@selector(loadingDisable) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Load" forState:UIControlStateNormal];
        btn;
    });
    
    UIButton *btnTop4 = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor colorWithRed:0.621 green:1.000 blue:0.604 alpha:1.000];
        btn.frame = CGRectMake(20, 180, 50, 50);
        [btn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Stop" forState:UIControlStateNormal];
        btn;
    });
    
    [self.view addSubview:btnTop1];
    [self.view addSubview:btnBom];
    [self.view addSubview:btnTop2];
    [self.view addSubview:btnTop3];
    [self.view addSubview:btnTop4];
    [self.view addSubview:btnTop5];
}

- (void)bom
{
    [TTHelper showRightHUDToViewBottom:self.view message:kHUDTitle_CommentSuccess];
}

- (void)top
{
    [TTHelper showNetworkToView:self.view];
}

- (void)center
{
    [TTHelper hideLoadingFromView:self.view];
//    [TTHelper showHUDToViewCenter:self.view message:kHUDTitle_NoMoneyNoBB];
    [TTHelper showSuccessHUDToView:self.view message:@"支付成功"];
//    [TTHelper showErrorHUDToView:self.view message:@"支付失败"];
}

- (void)stop
{
    [TTHelper hideLoadingFromView:self.view];
}
- (void)loading
{
    [TTHelper showLoadingToView:self.view];
}
- (void)loadingDisable
{
    [TTHelper showDisableLoadingToView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
