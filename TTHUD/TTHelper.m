//
//  TTHelper.m
//  TTHUD
//
//  Created by TangChi on 16/8/3.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "TTHelper.h"
#import "TTHUDView.h"
#import "TTHUDConfig.h"

@implementation TTHelper

#pragma mark - TT_HUD 相关方法

+ (void)showHUDToViewCenter:(UIView *)view message:(NSString *)message
{
    [TTHUDView showHUDToViewCenter:view message:message];
}

+ (void)showHUDToViewBottom:(UIView *)view message:(NSString *)message
{
    [TTHUDView showHUDToViewBottom:view message:message];
}

+ (void)showRightHUDToViewBottom:(UIView *)view message:(NSString *)message
{
    [TTHUDView showHUDToViewBottom:view message:message imageName:kImageName_RightImage];
}

+ (void)showPlusHUDToViewBottom:(UIView *)view message:(NSString *)message
{
    [TTHUDView showHUDToViewBottom:view message:message imageName:kImageName_PlusImage];
}

+ (void)showSuccessHUDToView:(UIView *)view message:(NSString *)message
{
    [TTHUDView showSuccessHUDToView:view message:message imageName:kImageName_CenterSuccess];
}

+ (void)showErrorHUDToView:(UIView *)view message:(NSString *)message
{
    [TTHUDView showErrorHUDToView:view message:message imageName:kImageName_CenterError];
}

+ (void)showLoadingToView:(UIView *)view
{
    [TTHUDView showLoadingToView:view];
}

+ (void)showDisableLoadingToView:(UIView *)view
{
    [TTHUDView showDisableLoadingToView:view];
}

+ (void)showNetworkToView:(UIView *)view
{
    [TTHUDView showNetworkToView:view];
}

+ (BOOL)hideLoadingFromView:(UIView *)view
{
    return [TTHUDView hideLoadingFromView:view];
}



@end
