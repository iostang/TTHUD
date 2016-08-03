//
//  UIView+HUD.m
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "UIView+HUD.h"
#import <objc/runtime.h>
#import "TTHUDView.h"

/*HUD类型Key*/
static const NSString * TTHUDTypeKey             = @"TTHUDTypeKey";
/*计时器Key*/
static const NSString * TTHUDTimerKey            = @"TTHUDTimerKey";

/*Hide时间*/
static const CGFloat DurationTime     = 0.2f;

/*显示时长*/
static const CGFloat ShowTime         = 2.0f;

static NSString * classAddress = @"";

@interface TTHUDManager ()

+ (instancetype)sharedManager;

@property (nonatomic, strong) NSMutableDictionary <NSNumber *,UIView *> * tt_dataSource;

@end

@implementation UIView (HUD)

- (void)tt_showHUD:(UIView *)hudView type:(TTHUDType)type
{
    hudView.alpha = 0;
    
    /* 使用self的内存地址来拼接type做唯一标示 当key使用 */
    classAddress      = [NSString stringWithFormat:@"%p",self];
    NSString *typeKey = [NSString stringWithFormat:@"%@_%ld",classAddress,type];

    
    NSMutableDictionary *hudTypeDict = [TTHUDManager sharedManager].tt_dataSource;
    
    /*如果字典里面已经包含这个HUD类型 就删除并隐藏之前的HUD 否则添加到字典*/
    if ([[hudTypeDict allKeys] containsObject:typeKey]) {
        
        UIView *view = [hudTypeDict objectForKey:typeKey];
        NSTimer *timer = (NSTimer *)objc_getAssociatedObject(view, &TTHUDTimerKey);
        [timer invalidate];
        [self tt_hideHUD:view];
        
    } else {
        
        [hudTypeDict setObject:hudView forKey:typeKey];
    }
    
    [self insertSubview:hudView atIndex:[self.subviews count]];
    
    /*给HUD添加一个Type属性用于判断*/
    objc_setAssociatedObject(hudView, &TTHUDTypeKey, typeKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [UIView animateWithDuration:DurationTime
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         hudView.alpha = 1.0;
                         
                     } completion:^(BOOL finished) {
                         
                         /*显示完成后用一个计时器延迟两秒Hide这个HUD*/
                         NSTimer *timer = [NSTimer timerWithTimeInterval:ShowTime target:self selector:@selector(tt_HUDTimerDidFinish:) userInfo:hudView repeats:NO];
                         [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                         
                         /*给这个HUD添加一个计时器属性*/
                         objc_setAssociatedObject(hudView, &TTHUDTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         
                         
                     }];
    
}

- (void)tt_showLoading:(UIView *)loadingView
{
    loadingView.alpha = 0;
    
    classAddress      = [NSString stringWithFormat:@"%p",self];
    NSString *typeKey = [NSString stringWithFormat:@"%@_%ld",classAddress,TTHUDTypeLoading];
    
    /*倒序数组 方便便利*/
    for (UIView * view in [self.subviews reverseObjectEnumerator]) {
        
        if ([view isKindOfClass:[TTHUDView class]] && ([objc_getAssociatedObject(view, &TTHUDTypeKey) isEqualToString: typeKey])) {
            return;
        }
        
    }
    
    [self insertSubview:loadingView atIndex:[self.subviews count]];
    
    /*给HUD添加一个Type属性用于判断*/
    objc_setAssociatedObject(loadingView, &TTHUDTypeKey, typeKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    [UIView animateWithDuration:DurationTime
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         loadingView.alpha = 1.0;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
}

/**
 *  这个隐藏方法只针对于Loading
 */
+ (BOOL)tt_hideLoadingFromView:(UIView *)view
{
    TTHUDView *hud = [self HUDForView:view];
    
    if (hud != nil) {
        
        [UIView animateWithDuration:DurationTime animations:^{
            
            hud.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [hud removeFromSuperview];
            
        }];
        
        return YES;
    }
    
    return NO;
}

+ (TTHUDView *)HUDForView:(UIView *)view
{
    /* 隐藏式需要给classaddress重新赋值 */
    classAddress      = [NSString stringWithFormat:@"%p",view];
    NSString *typeKey = [NSString stringWithFormat:@"%@_%ld",classAddress,TTHUDTypeLoading];
    
    /*倒序数组 方便便利*/
    for (UIView *subview in [view.subviews reverseObjectEnumerator]) {
        
        if ([subview isKindOfClass:self] && ([objc_getAssociatedObject(subview, &TTHUDTypeKey) isEqualToString: typeKey])) {
            
            return (TTHUDView *)subview;
        }
        
    }
    
    return nil;
}


/**
 *  计时器方法
 */
- (void)tt_HUDTimerDidFinish:(NSTimer *)timer
{
    [self tt_hideHUD:(UIView *)timer.userInfo];
    
}

/**
 *  隐藏HUD
 */
- (void)tt_hideHUD:(UIView *)hudView
{
    [UIView animateWithDuration:DurationTime
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         
                         hudView.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         
                         /*先将这个HUD从父视图删除*/
                         [hudView removeFromSuperview];
                         
                         NSMutableDictionary *hudTypeDict = [TTHUDManager sharedManager].tt_dataSource;
                         
                         /*如果dataSource字典里面包含这个HUD*/
                         if ([[hudTypeDict allValues] containsObject:hudView]) {
                             
                             [hudTypeDict removeObjectForKey:objc_getAssociatedObject(hudView, &TTHUDTypeKey)];
                         }
                         
                     }];
}

@end

/**
 *  创建一个单例类 datasource用于存储不同类型的HUD
 */
@implementation TTHUDManager : NSObject

+ (instancetype)sharedManager
{
    static TTHUDManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[TTHUDManager alloc] init];
    });
    
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tt_dataSource = @{}.mutableCopy;
    }
    return self;
}

@end

