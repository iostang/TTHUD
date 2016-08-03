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

/*文本背景高度*/
static CGFloat    const kNetWorkVeryBadHeight = 41;

/*Bottom的偏移量 118是设置的高度 需要减去tabbar高度*/
static CGFloat    const kTextBottomMargin     = 118-49;//69

/*label insets number*/
static CGFloat const kNumber_InsetsNumber = 14;


/*bundel and image name*/
static NSString * const kBundelName             = @"TTHUDResource.bundle";
static NSString * const kImageName_AddImage     = @"inform_icon_add_normal@2x";
static NSString * const kImageName_SuccessImage = @"inform_icon_success_normal@2x";
static NSString * const kImageName_LoadingImage = @"jiuailogo_loading";


#define kImage_CustomImage(name) \
({ \
NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:kBundelName]; \
UIImage *image_Add = [UIImage imageWithContentsOfFile: [[NSBundle bundleWithPath:bundlePath] pathForResource:name ofType:@"png"]]; \
image_Add; \
})


#define kImage_LoadingImage \
({\
NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:kBundelName]; \
NSData *data = [NSData dataWithContentsOfFile:[[NSBundle bundleWithPath:bundlePath] pathForResource:kImageName_LoadingImage ofType:@"gif"]]; \
UIImage *image_Loading = [UIImage sd_animatedGIFWithData:data]; \
image_Loading; \
})




/* label max width */
#define  kTitleLabel_PreferredMaxLayoutWidth   CGRectGetWidth([UIScreen mainScreen].bounds)-100
#define  kTitleLabel_PreferredMaxLayoutWidth_CenterHUD   80

#define kColor_TitleLabelBackground_BlackColor ([[UIColor blackColor] colorWithAlphaComponent:0.8])
#define kColor_TitleLabelBackground_RedColor   ([UIColor colorWithRed:234.0f/255.0f green:65.0f/255.0f blue:65.0f/255.0f alpha:0.860])
#define kColor_TitleLabelTextColor             ([UIColor whiteColor])

#define kFont_TitleLabelFont_NetworkVeryBad    ([UIFont boldSystemFontOfSize:14])
#define kFont_TitleLabelFont_Other             ([UIFont systemFontOfSize:15])

#define kTitleLabelBorderEdgeInsets            (UIEdgeInsetsMake(-kNumber_InsetsNumber, -kNumber_InsetsNumber, -kNumber_InsetsNumber, -kNumber_InsetsNumber))
#define kTitleLabelTextEdgeInsets              (UIEdgeInsetsMake(kNumber_InsetsNumber, kNumber_InsetsNumber, kNumber_InsetsNumber, kNumber_InsetsNumber))

#define kSize_LoadingSize                      ((CGSize){40,40})
#define kSize_SuccessHUDSize                   ((CGSize){100,100})


#endif /* TextHeader_h */
