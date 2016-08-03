//
//  TTHUDView.h
//  TTHUD
//
//  Created by TangChi on 16/8/1.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+HUD.h"


typedef NS_ENUM(NSInteger,TTHUDShowType) {
    
    TTHUDTitleTypeBottomMessage = 0,            //底部文本 或者文本和图片 细条
    TTHUDTitleTypeCenterMessage ,               //中间文本 或者文本和图片 细条
    
    TTHUDTitleTypeCenterErrorMessage ,          //中间显示文本+失败图片 大方块
    TTHUDTitleTypeCenterSuccessMessage ,        //中间显示文本+成功图片 大方块
    
    TTHUDTitleTypeLoadingMessage ,              //中间显示Loading的gif图 圆形
    
    TTHUDTitleTypeNetworkVeryBadMessage ,       //顶部显示纯文本 背景色为红色 细条

};

@interface TTHUDView : UIView


/**
 *  中间文本 细条
 */
+ (instancetype)showHUDToViewCenter:(UIView *)view message:(NSString *)message;

/**
 *  中间文本和图片 细条
 */
+ (instancetype)showHUDToViewCenter:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName;

/**
 *  底部文本 细条
 */
+ (instancetype)showHUDToViewBottom:(UIView *)view message:(NSString *)message;

/**
 *  底部文本和图片 细条
 */
+ (instancetype)showHUDToViewBottom:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName;

/**
 * 中间显示文本+成功图片 大方块
 */
+ (instancetype)showSuccessHUDToView:(UIView *)view message:(NSString *)message;

/**
 * 中间显示文本+自定义成功图片 大方块
 */
+ (instancetype)showSuccessHUDToView:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName;

/**
 * 中间显示文本+失败图片 大方块
 */
+ (instancetype)showErrorHUDToView:(UIView *)view message:(NSString *)message;

/**
 * 中间显示文本+自定义失败图片 大方块
 */
+ (instancetype)showErrorHUDToView:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName;

/**
 * 中间显示Loading的gif图 圆形
 */
+ (instancetype)showLoadingToView:(UIView *)view;

/**
 * 中间显示Loading的gif图  禁止下层级交互 圆形
 */
+ (instancetype)showDisableLoadingToView:(UIView *)view;

/**
 * 顶部显示纯文本 背景色为红色 细条
 */
+ (instancetype)showNetworkToView:(UIView *)view;

/**
 * 顶部显示自定义纯文本 背景色为红色 细条
 */
+ (instancetype)showNetworkToView:(UIView *)view customMessage:(NSString *)customMessage;

/**
 *  dismiss loading view
 */
+ (BOOL)hideLoadingFromView:(UIView *)view;

@end
