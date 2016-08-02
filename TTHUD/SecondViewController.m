//
//  SecondViewController.m
//  TTHUD
//
//  Created by TangChi on 16/8/1.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "SecondViewController.h"
#import "TTHUDView.h"
#import "TextHeader.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)bom
{
    [TTHUDView showHUDToViewCenter:self.view message:kHUDTitle_ClearCaChe];
}

- (void)center
{
    [TTHUDView showSuccessHUDToView:self.view message:kHUDTitle_SelectedGoodsSpecification];
}

- (void)top
{
    [TTHUDView showNetworkToView:self.view customMessage:@"没有网了哦 亲~"];
}


- (void)stop
{
    [TTHUDView hideLoadingHUDForView:self.view];
}

- (void)loading
{
    [TTHUDView showLoadingToView:self.view];
}
- (void)loading1
{
    [TTHUDView showDisableLoadingToView:self.view];
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
