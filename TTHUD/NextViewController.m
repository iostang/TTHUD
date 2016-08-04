//
//  NextViewController.m
//  TTHUD
//
//  Created by TangChi on 16/8/4.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "NextViewController.h"
#import "TTHelper.h"
#import "TTHUDConfig.h"
#import "UIImage+Gif.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)bom
{
    [TTHelper showRightHUDToViewBottom:self.view message:@"添加评论成功" position:CGPointMake(0, 0)];
}

- (void)top
{
    [TTHelper showNetworkToView:self.view position:CGPointMake(0, 64)];
}

- (void)center
{
    [TTHelper hideLoadingFromView:self.view];
    [TTHelper showHUDToViewCenter:self.view message:@"添加评论成功" position:CGPointMake(0, 150)];
    [TTHelper showSuccessHUDToView:self.view message:@"支付成功" position:CGPointMake(0, 0)];
//    [TTHelper showErrorHUDToView:self.view message:@"支付失败" position:CGPointMake(0, 150)];
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

- (void)next
{
    NextViewController *next = [NextViewController new];
    next.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:next animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
