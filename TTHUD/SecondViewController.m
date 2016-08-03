//
//  SecondViewController.m
//  TTHUD
//
//  Created by TangChi on 16/8/1.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "SecondViewController.h"
#import "TTHelper.h"

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
    [TTHelper showPlusHUDToViewBottom:self.view message:@"关注成功"];
}

- (void)center
{
    [TTHelper showSuccessHUDToView:self.view message:@"我们已经收到您的举报信息，会尽快进行处理! 感谢您!"];
}

- (void)top
{
    [TTHelper showNetworkToView:self.view];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
