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
