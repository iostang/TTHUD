//
//  TTHelper.h
//  TTHUD
//
//  Created by TangChi on 16/8/3.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTHelper : NSObject

#pragma mark - TT_HUD 相关方法

+ (void)showHUDToViewCenter:(UIView *)view message:(NSString *)message;
+ (void)showHUDToViewBottom:(UIView *)view message:(NSString *)message;

+ (void)showRightHUDToViewBottom:(UIView *)view message:(NSString *)message;
+ (void)showPlusHUDToViewBottom:(UIView *)view message:(NSString *)message;

+ (void)showSuccessHUDToView:(UIView *)view message:(NSString *)message;
+ (void)showErrorHUDToView:(UIView *)view message:(NSString *)message;

+ (void)showLoadingToView:(UIView *)view;
+ (void)showDisableLoadingToView:(UIView *)view;

+ (void)showNetworkToView:(UIView *)view;

+ (BOOL)hideLoadingFromView:(UIView *)view;


@end
