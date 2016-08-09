//
//  TTHelper.m
//  TTHUD
//
//  Created by TangChi on 16/8/3.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "TTHelper.h"
#import "TTHUDView.h"

@implementation TTHelper

#pragma mark - TT_HUD 相关方法
#pragma mark -


#pragma mark - 普通
#pragma mark -

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

#pragma mark - 隐藏
#pragma mark -

+ (BOOL)hideLoadingFromView:(UIView *)view
{
    return [TTHUDView hideLoadingFromView:view];
}

+ (BOOL)hideLoadingFromView:(UIView *)view delay:(NSTimeInterval)delay
{
    return [TTHUDView hideLoadingFromView:view delay:delay];
}

#pragma mark - 自定义位置
#pragma mark -

+ (void)showHUDToViewCenter:(UIView *)view message:(NSString *)message position:(CGPoint)position
{
    [TTHUDView showHUDToViewCenter:view message:message position:position];
}
+ (void)showHUDToViewBottom:(UIView *)view message:(NSString *)message position:(CGPoint)position
{
    [TTHUDView showHUDToViewBottom:view message:message position:position];
}

+ (void)showRightHUDToViewBottom:(UIView *)view message:(NSString *)message position:(CGPoint)position
{
   [TTHUDView showHUDToViewBottom:view message:message imageName:kImageName_RightImage position:position];
}
+ (void)showPlusHUDToViewBottom:(UIView *)view message:(NSString *)message position:(CGPoint)position
{
    [TTHUDView showHUDToViewBottom:view message:message imageName:kImageName_PlusImage position:position];
}

+ (void)showSuccessHUDToView:(UIView *)view message:(NSString *)message position:(CGPoint)position
{
    [TTHUDView showSuccessHUDToView:view message:message position:position];
}

+ (void)showErrorHUDToView:(UIView *)view message:(NSString *)message position:(CGPoint)position
{
    [TTHUDView showErrorHUDToView:view message:message position:position];
}

+ (void)showLoadingToView:(UIView *)view position:(CGPoint)position
{
    [TTHUDView showLoadingToView:view position:position];
}

+ (void)showNetworkToView:(UIView *)view position:(CGPoint)position
{
    [TTHUDView showNetworkToView:view position:position];
}

@end
