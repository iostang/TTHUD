//
//  ViewController.m
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "ViewController.h"

#import "TTHUDView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-49);
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
        [btn addTarget:self action:@selector(loading1) forControlEvents:UIControlEventTouchUpInside];
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
    [TTHUDView showClearCaCheHUDAddedToView:self.view];
}

- (void)top
{
    [TTHUDView showNetworkVeryBadHUDAddedToView:self.view];
}

- (void)center
{
    [TTHUDView showNoMoneyNoBBHUDAddedToView:self.view];
}

- (void)stop
{
    [TTHUDView hideLoadingHUDForView:self.view];
}
- (void)loading
{
    [TTHUDView showLoadingHUDAddedToView:self.view];
}
- (void)loading1
{
    [TTHUDView showDisableInteractionLoading:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
