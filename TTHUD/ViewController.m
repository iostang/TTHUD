//
//  ViewController.m
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIButton *btn = ({
        UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(20, 20, 50, 50);
        [btn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    
    UIButton *btn1 = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(120, 20, 50, 50);
        [btn addTarget:self action:@selector(goback1) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    UIButton *btn2 = ({
        UIButton *btn =   [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(20, 80, 50, 50);
        [btn addTarget:self action:@selector(goback2) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    [self.view addSubview:btn];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    
}

- (void)goback
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:0.4686 green:0.6716 blue:1.0 alpha:0.7];
    btn.frame = CGRectMake(120, 200, 150, 50);
    
    [self.view tt_showHUD:btn type:TTHUDTypeTop];
}

- (void)goback2
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:0.9987 green:0.4143 blue:0.4445 alpha:0.7];
    btn.frame = CGRectMake(120, 300, 150, 50);
    
    [self.view tt_showHUD:btn type:TTHUDTypeTop];
}

- (void)goback1
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:0.4686 green:0.6716 blue:1.0 alpha:0.7];
    btn.frame = CGRectMake(120, CGRectGetHeight(self.view.bounds) - 100, 150, 50);
    
    [self.view tt_showHUD:btn type:TTHUDTypeBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
