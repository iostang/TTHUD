//
//  TTHUDView.m
//  TTHUD
//
//  Created by TangChi on 16/8/1.
//  Copyright © 2016年 TonyTong. All rights reserved.
//

#import "TTHUDView.h"
#import <Masonry/Masonry.h>
#import "UIImage+GIF.h"



/*最大行数*/
static NSUInteger const kTitleLabelMaxLine    = 5;

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

/* label max width */
#define  kTitleLabel_PreferredMaxLayoutWidth   CGRectGetWidth([UIScreen mainScreen].bounds)-100

#define kColor_TitleLabelBackground_BlackColor ([[UIColor blackColor] colorWithAlphaComponent:0.8])
#define kColor_TitleLabelBackground_RedColor   ([UIColor colorWithRed:234.0f/255.0f green:65.0f/255.0f blue:65.0f/255.0f alpha:0.860])
#define kColor_TitleLabelTextColor             ([UIColor whiteColor])

#define kFont_TitleLabelFont_NetworkVeryBad    ([UIFont boldSystemFontOfSize:14])
#define kFont_TitleLabelFont_Other             ([UIFont systemFontOfSize:15])

#define kTitleLabelBorderEdgeInsets            (UIEdgeInsetsMake(-kNumber_InsetsNumber, -kNumber_InsetsNumber, -kNumber_InsetsNumber, -kNumber_InsetsNumber))
#define kTitleLabelTextEdgeInsets              (UIEdgeInsetsMake(kNumber_InsetsNumber, kNumber_InsetsNumber, kNumber_InsetsNumber, kNumber_InsetsNumber))

#define kSize_LoadingSize                      ((CGSize){40,40})
#define kSize_SuccessHUDSize                   ((CGSize){100,100})

#define kImage_AddImage \
({ \
NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:kBundelName]; \
UIImage *image_Add = [UIImage imageWithContentsOfFile: [[NSBundle bundleWithPath:bundlePath] pathForResource:kImageName_AddImage ofType:@"png"]]; \
image_Add; \
})

#define kImage_SuccessImage \
({ \
NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:kBundelName]; \
UIImage *image_Success = [UIImage imageWithContentsOfFile: [[NSBundle bundleWithPath:bundlePath] pathForResource:kImageName_SuccessImage ofType:@"png"]]; \
image_Success; \
})

#define kImage_LoadingImage \
({\
NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:kBundelName]; \
NSData *data = [NSData dataWithContentsOfFile:[[NSBundle bundleWithPath:bundlePath] pathForResource:kImageName_LoadingImage ofType:@"gif"]]; \
UIImage *image_Loading = [UIImage sd_animatedGIFWithData:data]; \
image_Loading; \
})


@interface TTLabel : UILabel

@end

@interface TTHUDView ()

/**
 *  HUD类型
 */
@property (nonatomic, assign) TTHUDShowType type;

/**
 *  纯文本加背景色类型的提示
 */
@property (nonatomic, strong) TTLabel *titleLabel;

/**
 *  loading 类型的提示
 */
@property (nonatomic, strong) UIImageView *loadingImageView;

/**
 *  显示自定义文案
 */
@property (nonatomic, copy  ) NSString *message;

@end

@implementation TTHUDView

#pragma mark - 各种类型的HUD


/**
 *  中间文本 或者文本和图片 细条
 */
+ (instancetype)showHUDToViewCenter:(UIView *)view message:(NSString *)message
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCenterMessage message:message];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

/**
 *  底部文本 或者文本和图片 细条
 */
+ (instancetype)showHUDToViewBottom:(UIView *)view message:(NSString *)message
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeBottomMessage message:message];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

/**
 * 中间显示文本+成功图片 大方块
 */
+ (instancetype)showSuccessHUDToView:(UIView *)view message:(NSString *)message
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCenterSuccessMessage message:message];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

/**
 * 中间显示文本+失败图片 大方块
 */
+ (instancetype)showErrorHUDToView:(UIView *)view message:(NSString *)message
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCenterErrorMessage message:message];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

/**
 * 中间显示Loading的gif图 圆形
 */
+ (instancetype)showLoadingToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeLoadingMessage message:nil];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeLoading];
    return hud;
}

/**
 * 中间显示Loading的gif图  禁止下层级交互 圆形
 */
+ (instancetype)showDisableLoadingToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeLoadingMessage message:nil];
    hud.frame      = view.bounds;
    hud.userInteractionEnabled = YES;
    [view tt_showHUD:hud type:TTHUDTypeLoading];
    return hud;
}

/**
 * 顶部显示纯文本 背景色为红色 细条
 */
+ (instancetype)showNetworkToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNetworkVeryBadMessage message:@"网络有点慢，好心塞"];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeTop];
    return hud;
}

/**
 * 顶部显示自定义纯文本 背景色为红色 细条
 */
+ (instancetype)showNetworkToView:(UIView *)view customMessage:(NSString *)customMessage
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNetworkVeryBadMessage message:customMessage];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeTop];
    return hud;
}


#pragma mark - init

- (instancetype)initWithType:(TTHUDShowType)type message:(NSString *)message
{
    self = [super init];
    if (self) {
        
        self.message = message;
        self.type = type;
        
        [self config];
        
    }
    return self;
}

- (void)config
{
    self.userInteractionEnabled = NO;
    [self setupViews];
}

- (void)setupViews
{
    switch (self.type) {
        case TTHUDTitleTypeCenterMessage: {
            
            self.titleLabel.text = self.message;
            [self addSubview:self.titleLabel];

            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
            }];
        }
            break;
            
        case TTHUDTitleTypeBottomMessage: {
            
             self.titleLabel.text = self.message;
            [self addSubview:self.titleLabel];

            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-kTextBottomMargin);
                make.centerX.mas_equalTo(self);
            }];
        }
            break;
            
        case TTHUDTitleTypeCenterSuccessMessage:
        case TTHUDTitleTypeCenterErrorMessage: {
            
            self.titleLabel.text = self.message;
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
                make.size.mas_equalTo(kSize_SuccessHUDSize);
            }];
        }
            break;
            
        case TTHUDTitleTypeLoadingMessage: {
            
            [self addSubview:self.loadingImageView];

            [self.loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
            }];

        }
            break;
            
        case TTHUDTitleTypeNetworkVeryBadMessage: {
            
            self.titleLabel.layer.cornerRadius  = 0;
            self.titleLabel.layer.masksToBounds = NO;
            self.titleLabel.text                = self.message;
            self.titleLabel.font                = kFont_TitleLabelFont_NetworkVeryBad;
            self.titleLabel.backgroundColor     = kColor_TitleLabelBackground_RedColor;

            [self addSubview:self.titleLabel];

            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.left.right.mas_equalTo(self);
                make.height.mas_equalTo(kNetWorkVeryBadHeight);
                make.top.mas_equalTo(self).offset(-kNetWorkVeryBadHeight);
            }];

        }
            break;
    }
    
    [self tt_updateConstraints];
}

- (void)tt_updateConstraints
{
    switch (self.type) {
        case TTHUDTitleTypeCenterMessage:
        case TTHUDTitleTypeBottomMessage:
        case TTHUDTitleTypeCenterSuccessMessage:
        case TTHUDTitleTypeCenterErrorMessage:
        case TTHUDTitleTypeLoadingMessage: {
        }
            break;
            
        case TTHUDTitleTypeNetworkVeryBadMessage: {
            
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self);
            }];
            [UIView animateWithDuration:0.25 animations:^{
                [self layoutIfNeeded];
            }];
            
        }
            break;
    }
   
}

#pragma mark - 根据枚举类型返回对应的字符串

#pragma mark - 设置富文本字符串

- (void)labelTitle:(NSString *)title labelImage:(UIImage *)image
{
    // 创建一个富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:title];

    //添加图片
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image             = image;
    attch.bounds            = CGRectMake(0, 0, image.size.width, image.size.width);

    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    NSAttributedString *place  = [[NSAttributedString alloc] initWithString:@"  "];
    [attri insertAttributedString:string atIndex:0];
    [attri insertAttributedString:place atIndex:1];
    
    self.titleLabel.attributedText = attri;
}

#pragma mark - lazy load

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            TTLabel *label                = [TTLabel new];
            label.numberOfLines           = kTitleLabelMaxLine;
            label.textColor               = kColor_TitleLabelTextColor;
            label.backgroundColor         = kColor_TitleLabelBackground_BlackColor;
            label.font                    = kFont_TitleLabelFont_Other;
            label.textAlignment           = NSTextAlignmentCenter;
            label.layer.cornerRadius      = 5;
            label.layer.masksToBounds     = YES;
            label.preferredMaxLayoutWidth = kTitleLabel_PreferredMaxLayoutWidth;
            label;
        });
    }
    return _titleLabel;
}

- (UIImageView *)loadingImageView
{
    if (!_loadingImageView) {
        _loadingImageView = ({
            UIImageView *imageView = [UIImageView new];
            imageView.image        = kImage_LoadingImage;
            imageView;
        });
        
    }
    return _loadingImageView;
}


@end

#pragma mark - TTLabel

@implementation TTLabel

- (CGSize)intrinsicContentSize
{
    return UIEdgeInsetsInsetRect((CGRect){0,0,[super intrinsicContentSize]}, kTitleLabelBorderEdgeInsets).size;
}

- (void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect,kTitleLabelTextEdgeInsets)];
}

@end
