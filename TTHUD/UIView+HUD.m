//
//  UIView+HUD.m
//  TTHUD
//
//  Created by TonyTong on 16/7/29.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "UIView+HUD.h"
#import <objc/runtime.h>

static const NSString * TTHUDTypeKey  = @"TTHUDTypeKey";
static const NSString * TTHUDTimerKey = @"TTHUDTimerKey";

static const CGFloat DurationTime     = 0.2;
static const CGFloat ShowTime         = 2.0;


@implementation UIView (HUD)

- (void)tt_showHUD:(UIView *)hudView type:(TTHUDType)type
{
    hudView.alpha = 0;
    
    [self addSubview:hudView];
    
    objc_setAssociatedObject(hudView, &TTHUDTypeKey, @(type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSMutableDictionary *dic = [TTHUDManager sharedManager].tt_HUDDataSource;
    
    if ([[dic allKeys] containsObject:@(type)]) {
        
        UIView *view = [dic objectForKey:@(type)];
        
        NSTimer *timer = (NSTimer *)objc_getAssociatedObject(view, &TTHUDTimerKey);
        [timer invalidate];
        
        [self tt_hideHUD:view];
        
    } else {
        
        [dic setObject:hudView forKey:@(type)];
    }
    
    [UIView animateWithDuration:DurationTime
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         hudView.alpha = 1.0;
                         
                     } completion:^(BOOL finished) {
                         
                         NSTimer *timer = [NSTimer timerWithTimeInterval:ShowTime target:self selector:@selector(tt_HUDTimerDidFinish:) userInfo:hudView repeats:NO];
                         [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                         
                         objc_setAssociatedObject(hudView, &TTHUDTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         
                     }];
    
}


- (void)tt_HUDTimerDidFinish:(NSTimer *)timer
{
    [self tt_hideHUD:(UIView *)timer.userInfo];
    
}

- (void)tt_hideHUD:(UIView *)hudView
{
    [UIView animateWithDuration:DurationTime
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         
                         hudView.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         
                         [hudView removeFromSuperview];
                         
                         NSMutableDictionary *dic = [TTHUDManager sharedManager].tt_HUDDataSource;
                         
                         if ([[dic allValues] containsObject:hudView]) {
                             id key =  objc_getAssociatedObject(hudView, &TTHUDTypeKey);
                             if (key) {
                                 [dic removeObjectForKey:key];
                             }
                         }
                         
                     }];
    
    
}

@end


@interface TTHUDManager ()


@end

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
        self.tt_HUDDataSource = @{}.mutableCopy;
    }
    return self;
}


@end