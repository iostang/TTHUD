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

#define kImage_AddImage                        ([UIImage imageNamed:@"inform_icon_add_normal"])
#define kImage_SuccessImage                    ([UIImage imageNamed:@"inform_icon_success_normal"])
#define kImage_LoadingImage                    ([UIImage sd_animatedGIFNamed:@"jiuailogo_loading"])


@interface TTLabel : UILabel

@end

@interface TTHUDView ()

/**
 *  HUD类型
 */
@property (nonatomic, assign) TTHUDTitleType type;

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

+ (instancetype)showSelectedBrandHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeSelectedBrand];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showSelectedGoodsSpecHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeSelectedGoodsSpecification];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showAddDetailDescHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeAddDetailDescription];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showSelectedCategoryHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeSelectedCategory];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showSelectedIsNewHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeSelectedIsNew];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showNoTitleNoCanHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNoTitleNoCan];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showNoMoneyNoBBHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNoMoneyNoBB];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showPostageCannotBeZeroHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypePostageCannotBeZero];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showClearCaCheHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeClearCaChe];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

+ (instancetype)showFocusSuccessHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeFocusSuccess];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

+ (instancetype)showCommentSuccessHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCommentSuccess];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

+ (instancetype)showLoadingHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeLoading];
    hud.frame      = view.bounds;
    [view tt_showLoading:hud];
    return hud;
}

+ (instancetype)showDisableInteractionLoading:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeLoading];
    hud.frame      = view.bounds;
    hud.userInteractionEnabled = YES;
    [view tt_showLoading:hud];
    return hud;

}

+ (instancetype)showNetworkVeryBadHUDAddedToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNetworkVeryBad];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeTop];
    return hud;
}

+ (instancetype)showMessageHUDToViewCenter:(UIView *)view message:(NSString *)message
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCustomCenterMessage message:message];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

+ (instancetype)showMessageHUDToViewBottom:(UIView *)view message:(NSString *)message
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCustomBottomMessage message:message];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

#pragma mark - init

- (instancetype)initWithType:(TTHUDTitleType)type message:(NSString *)message
{
    self = [super init];
    if (self) {
        self.message = message;
        self.userInteractionEnabled = NO;
        self.type = type;
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithType:(TTHUDTitleType)type
{
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = NO;
        self.type = type;
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    switch (self.type) {
        case TTHUDTitleTypeSelectedBrand:
        case TTHUDTitleTypeSelectedGoodsSpecification:
        case TTHUDTitleTypeAddDetailDescription:
        case TTHUDTitleTypeSelectedCategory:
        case TTHUDTitleTypeSelectedIsNew:
        case TTHUDTitleTypeNoTitleNoCan:
        case TTHUDTitleTypeNoMoneyNoBB:
        case TTHUDTitleTypePostageCannotBeZero:
        case TTHUDTitleTypeCustomCenterMessage: {
            
            self.titleLabel.text = [self convertToString:self.type];
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self);
                make.centerX.mas_equalTo(self);
            }];
            
            break;
        }
        case TTHUDTitleTypeFocusSuccess: {
            
            [self labelTitle:[self convertToString:self.type] labelImage:kImage_AddImage];
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-kTextBottomMargin);
                make.centerX.mas_equalTo(self);
            }];

            break;
        }
        case TTHUDTitleTypeCommentSuccess: {
            
            [self labelTitle:[self convertToString:self.type] labelImage:kImage_SuccessImage];
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-kTextBottomMargin);
                make.centerX.mas_equalTo(self);
            }];
        
            break;
        }
        case TTHUDTitleTypeClearCaChe: {
            
            [self labelTitle:[self convertToString:self.type] labelImage:kImage_SuccessImage];
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-kTextBottomMargin);
                make.centerX.mas_equalTo(self);
            }];
            
            break;
        }
        case TTHUDTitleTypeLoading: {
            
            [self addSubview:self.loadingImageView];
            
            [self.loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self);
                make.centerX.mas_equalTo(self);
            }];
            
            break;
        }
        case TTHUDTitleTypeNetworkVeryBad: {
            
            self.titleLabel.backgroundColor     = kColor_TitleLabelBackground_RedColor;
            self.titleLabel.layer.cornerRadius  = 0;
            self.titleLabel.layer.masksToBounds = NO;
            self.titleLabel.font                = kFont_TitleLabelFont_NetworkVeryBad;
            self.titleLabel.text                = [self convertToString:self.type];
            
            [self addSubview:self.titleLabel];
     
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(self);
                make.centerX.mas_equalTo(self);
                make.height.mas_equalTo(kNetWorkVeryBadHeight);
                make.top.mas_equalTo(self).offset(-kNetWorkVeryBadHeight);
            }];
            
            break;
        }
        case TTHUDTitleTypeCustomBottomMessage: {
            
            self.titleLabel.text = [self convertToString:self.type];
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-kTextBottomMargin);
                make.centerX.mas_equalTo(self);
            }];
            
            break;
        }
    }
    
    [self tt_updateConstraints];
}

- (void)tt_updateConstraints
{
    switch (self.type) {
        case TTHUDTitleTypeSelectedBrand:
        case TTHUDTitleTypeSelectedGoodsSpecification:
        case TTHUDTitleTypeAddDetailDescription:
        case TTHUDTitleTypeSelectedCategory:
        case TTHUDTitleTypeSelectedIsNew:
        case TTHUDTitleTypeNoTitleNoCan:
        case TTHUDTitleTypeNoMoneyNoBB:
        case TTHUDTitleTypePostageCannotBeZero: {
            break;
        }
        case TTHUDTitleTypeClearCaChe:
        case TTHUDTitleTypeFocusSuccess:
        case TTHUDTitleTypeCommentSuccess: {
            break;
        }
        case TTHUDTitleTypeLoading: {
            break;
        }
        case TTHUDTitleTypeNetworkVeryBad: {
            
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self);
            }];
            [UIView animateWithDuration:0.25 animations:^{
                [self layoutIfNeeded];
            }];
           
            break;
        }
        case TTHUDTitleTypeCustomCenterMessage: {
            break;
        }
        case TTHUDTitleTypeCustomBottomMessage: {
            break;
        }
    }
    
    
   
}

#pragma mark - 根据枚举类型返回对应的字符串

- (NSString*)convertToString:(TTHUDTitleType)type
{
    NSString *result = nil;
    
    switch (type) {
        case TTHUDTitleTypeSelectedBrand: {
            result = kHUDTitle_SelectedBrand;
            break;
        }
        case TTHUDTitleTypeSelectedGoodsSpecification: {
            result = kHUDTitle_SelectedGoodsSpecification;
            break;
        }
        case TTHUDTitleTypeAddDetailDescription: {
            result = kHUDTitle_AddDetailDescription;
            break;
        }
        case TTHUDTitleTypeSelectedCategory: {
            result = kHUDTitle_SelectedCategory;
            break;
        }
        case TTHUDTitleTypeSelectedIsNew: {
            result = kHUDTitle_SelectedIsNew;
            break;
        }
        case TTHUDTitleTypeNoTitleNoCan: {
            result = kHUDTitle_NoTitleNoCan;
            break;
        }
        case TTHUDTitleTypeNoMoneyNoBB: {
            result = kHUDTitle_NoMoneyNoBB;
            break;
        }
        case TTHUDTitleTypePostageCannotBeZero: {
            result = kHUDTitle_PostageCannotBeZero;
            break;
        }
        case TTHUDTitleTypeClearCaChe: {
            result = kHUDTitle_ClearCaChe;
            break;
        }
        case TTHUDTitleTypeFocusSuccess: {
            result = kHUDTitle_FocusSuccess;
            break;
        }
        case TTHUDTitleTypeCommentSuccess: {
            result = kHUDTitle_CommentSuccess;
            break;
        }
        case TTHUDTitleTypeLoading: {
            result = kHUDTitle_Loading;
            break;
        }
        case TTHUDTitleTypeNetworkVeryBad: {
            result = kHUDTitle_NetworkVeryBad;
            break;
        }
        case TTHUDTitleTypeCustomCenterMessage: {
            result =  self.message;
            break;
        }
        case TTHUDTitleTypeCustomBottomMessage: {
            result = self.message;
            break;
        }
            
    }
    return result;
}

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
