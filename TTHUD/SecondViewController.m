//
//  SecondViewController.m
//  TTHUD
//
//  Created by TangChi on 16/8/1.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "SecondViewController.h"
#import "TTHUDView.h"

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
    [TTHUDView showFocusSuccessHUDAddedToView:self.view];
}

- (void)center
{
    [TTHUDView showMessageHUDToViewCenter:self.view message:@"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------"];
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
