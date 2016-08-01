//
//  TTHUDView.h
//  TTHUD
//
//  Created by TangChi on 16/8/1.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+HUD.h"


/*center*/
static NSString * const kHUDTitle_SelectedBrand              = @"请选择品牌";
/*center*/
static NSString * const kHUDTitle_SelectedGoodsSpecification = @"请选择商品属性规格";
/*center*/
static NSString * const kHUDTitle_AddDetailDescription       = @"请添加详细描述";
/*center*/
static NSString * const kHUDTitle_SelectedCategory           = @"请选择分类";
/*center*/
static NSString * const kHUDTitle_SelectedIsNew              = @"请选择是否全新";
/*center*/
static NSString * const kHUDTitle_NoTitleNoCan               = @"没有标题怎么行";
/*center*/
static NSString * const kHUDTitle_NoMoneyNoBB                = @"不能不谈价格哦";
/*center*/
static NSString * const kHUDTitle_PostageCannotBeZero        = @"邮费不能为零";
//bottom
static NSString * const kHUDTitle_ClearCaChe                 = @"缓存清理成功";
//bottom + image
static NSString * const kHUDTitle_FocusSuccess               = @"关注成功";
//bottom + image
static NSString * const kHUDTitle_CommentSuccess             = @"添加评论成功";
/*center*/
static NSString * const kHUDTitle_Loading                    = @"Loading";
/*Network*/
static NSString * const kHUDTitle_NetworkVeryBad             = @"网络有点慢，好心塞";

typedef NS_ENUM(NSInteger,TTHUDTitleType) {
    
    TTHUDTitleTypeSelectedBrand = 0,
    TTHUDTitleTypeSelectedGoodsSpecification ,
    TTHUDTitleTypeAddDetailDescription ,
    TTHUDTitleTypeSelectedCategory ,
    TTHUDTitleTypeSelectedIsNew ,
    TTHUDTitleTypeNoTitleNoCan ,
    TTHUDTitleTypeNoMoneyNoBB ,
    TTHUDTitleTypePostageCannotBeZero ,
    TTHUDTitleTypeClearCaChe ,
    TTHUDTitleTypeFocusSuccess ,
    TTHUDTitleTypeCommentSuccess ,
    TTHUDTitleTypeLoading ,
    TTHUDTitleTypeNetworkVeryBad ,
};

@interface TTHUDView : UIView

/**
 *  请选择品牌
 */
+ (instancetype)showSelectedBrandHUDAddedToView:(UIView *)view;
/**
 *  请选择商品属性规格
 */
+ (instancetype)showSelectedGoodsSpecHUDAddedToView:(UIView *)view;
/**
 *  请添加详细描述
 */
+ (instancetype)showAddDetailDescHUDAddedToView:(UIView *)view;
/**
 *  请选择分类
 */
+ (instancetype)showSelectedCategoryHUDAddedToView:(UIView *)view;
/**
 *  请选择是否全新
 */
+ (instancetype)showSelectedIsNewHUDAddedToView:(UIView *)view;
/**
 *  没有标题怎么行
 */
+ (instancetype)showNoTitleNoCanHUDAddedToView:(UIView *)view;
/**
 *  不能不谈价格哦
 */
+ (instancetype)showNoMoneyNoBBHUDAddedToView:(UIView *)view;
/**
 *  邮费不能为零
 */
+ (instancetype)showPostageCannotBeZeroHUDAddedToView:(UIView *)view;
/**
 *  缓存清理成功
 */
+ (instancetype)showClearCaCheHUDAddedToView:(UIView *)view;
/**
 *  关注成功
 */
+ (instancetype)showFocusSuccessHUDAddedToView:(UIView *)view;
/**
 *  添加评论成功
 */
+ (instancetype)showCommentSuccessHUDAddedToView:(UIView *)view;
/**
 *  Loading
 */
+ (instancetype)showLoadingHUDAddedToView:(UIView *)view;
/**
 *  Loading And DisableInteraction
 */
+ (instancetype)showDisableInteractionLoading:(UIView *)view;
/**
 *  网络有点慢，好心塞
 */
+ (instancetype)showNetworkVeryBadHUDAddedToView:(UIView *)view;

@end
