//
//  TTHUDConfig.h
//  TTHUD
//
//  Created by TangChi on 16/8/2.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#ifndef TextHeader_h
#define TextHeader_h

/*最大行数*/
static NSUInteger const kTitleLabelMaxLine           = 10;
static NSUInteger const kTitleLabelMaxLine_CenterHUD = 10;

/*label insets number*/
static CGFloat const kNumber_InsetsNumber            = 14;

/*bundel and image name*/
static NSString * const kBundelName              = @"TTHUDResource.bundle";

static NSString * const kImageName_PlusImage     = @"inform_icon_add_normal@2x";
static NSString * const kImageName_RightImage    = @"inform_icon_success_normal@2x";

static NSString * const kImageName_CenterError   = @"inform_icon_center_defeat_normal@2x";
static NSString * const kImageName_CenterSuccess = @"inform_icon_center_success_normal@2x";

static NSString * const kImageName_LoadingImage  = @"jiuailogo_loading";


#define kImage_CustomImage(name) \
({ \
UIImage *image_Add = [UIImage imageNamed:[kBundelName stringByAppendingPathComponent:name]]; \
image_Add; \
})


#define kImage_LoadingImage \
({\
UIImage *image_Loading = [UIImage sd_animatedGIFNamed:[kBundelName stringByAppendingPathComponent:kImageName_LoadingImage]]; \
image_Loading; \
})


#define kColor_TitleLabelBackground_BlackColor ([[UIColor blackColor] colorWithAlphaComponent:0.8])
#define kColor_TitleLabelBackground_RedColor   ([UIColor colorWithRed:234.0f/255.0f green:65.0f/255.0f blue:65.0f/255.0f alpha:0.860])
#define kColor_TitleLabelTextColor             ([UIColor whiteColor])

#define kFont_TitleLabelFont_NetworkVeryBad    ([UIFont boldSystemFontOfSize:14])
#define kFont_TitleLabelFont_Other             ([UIFont systemFontOfSize:15])

#define kTitleLabelBorderEdgeInsets            (UIEdgeInsetsMake(-kNumber_InsetsNumber, -kNumber_InsetsNumber, -kNumber_InsetsNumber, -kNumber_InsetsNumber))
#define kTitleLabelTextEdgeInsets              (UIEdgeInsetsMake(kNumber_InsetsNumber, kNumber_InsetsNumber, kNumber_InsetsNumber, kNumber_InsetsNumber))

/** UIApplicatoin **/
#define kApplication [UIApplication sharedApplication]

/** UIApplication Delegate **/
#define kAppDelegate [(AppDelegate*)kApplication  delegate]

/** UIApplication KeyWindow **/
#define kAppKeyWindow [kApplication keyWindow]

#define kWidth_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kHeight_ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kHeight_NavigationBarHeightAndStatusBarHeight (kHeight_NavigationBarHeight + kHeight_StatusBarHeight)

#define kHeight_NavigationBarHeight  44
#define kHeight_StatusBarHeight      20
#define kHeight_TabBarHeight         49

/* Bottom状态下距离底部的默认高度 */
#define kHeight_TextBottomMargin     118

/* 没网时文本高度*/
#define kHeight_NetWorkVeryBadHeight 44

/* label max width */
#define  kTitleLabel_PreferredMaxLayoutWidth           (kWidth_ScreenWidth-100)
#define  kTitleLabel_PreferredMaxLayoutWidth_CenterHUD 90

/* Loading size*/
#define kSize_LoadingSize     ((CGSize){40,40})

/* HUD size */
#define kSize_SuccessHUDSize  ((CGSize){110,110})

#endif /* TextHeader_h */
