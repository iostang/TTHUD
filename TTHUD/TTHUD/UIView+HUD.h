//
//  UIView+HUD.h
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, TTHUDType) {
    TTHUDTypeTop     = 1,
    TTHUDTypeCenter  = 2,
    TTHUDTypeBottom  = 3,
    TTHUDTypeLoading = 4,
};


@interface UIView (HUD)

- (void)tt_showHUD:(UIView *)hudView type:(TTHUDType)type;
- (void)tt_showLoading:(UIView *)loadingView;

+ (BOOL)hideLoadingHUDForView:(UIView *)view;

@end


@interface TTHUDManager : NSObject

@end