//
//  UIView+HUD.h
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, TTHUDType) {
    TTHUDTypeTop    = 1,
    TTHUDTypeCenter = 2,
    TTHUDTypeBottom = 3,
};


@interface UIView (HUD)

- (void)tt_showHUD:(UIView *)hudView type:(TTHUDType)type;

@end


@interface TTHUDManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong) NSMutableDictionary <NSNumber *,UIView *> * tt_HUDDataSource;

@end