//
//  TTHelper.h
//  TTHUD
//
//  Created by TangChi on 16/8/3.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TTHUDConfig.h"

@interface TTHelper : NSObject

#pragma mark - TT_HUD 相关方法

#pragma mark - 普通
#pragma mark -
+ (void)showHUDToViewCenter:(UIView *)view message:(NSString *)message;
+ (void)showHUDToViewBottom:(UIView *)view message:(NSString *)message;

+ (void)showRightHUDToViewBottom:(UIView *)view message:(NSString *)message;
+ (void)showPlusHUDToViewBottom:(UIView *)view message:(NSString *)message;

+ (void)showSuccessHUDToView:(UIView *)view message:(NSString *)message;
+ (void)showErrorHUDToView:(UIView *)view message:(NSString *)message;

+ (void)showLoadingToView:(UIView *)view;
+ (void)showDisableLoadingToView:(UIView *)view;

+ (void)showNetworkToView:(UIView *)view;

#pragma mark - 隐藏
#pragma mark -
+ (BOOL)hideLoadingFromView:(UIView *)view;
+ (BOOL)hideLoadingFromView:(UIView *)view delay:(NSTimeInterval)delay;
#pragma mark - 自定义位置
#pragma mark -

+ (void)showHUDToViewCenter:(UIView *)view message:(NSString *)message position:(CGPoint)position;
+ (void)showHUDToViewBottom:(UIView *)view message:(NSString *)message position:(CGPoint)position;

+ (void)showRightHUDToViewBottom:(UIView *)view message:(NSString *)message position:(CGPoint)position;
+ (void)showPlusHUDToViewBottom:(UIView *)view message:(NSString *)message position:(CGPoint)position;

+ (void)showSuccessHUDToView:(UIView *)view message:(NSString *)message position:(CGPoint)position;
+ (void)showErrorHUDToView:(UIView *)view message:(NSString *)message position:(CGPoint)position;

+ (void)showLoadingToView:(UIView *)view position:(CGPoint)position;

+ (void)showNetworkToView:(UIView *)view position:(CGPoint)position;

@end
