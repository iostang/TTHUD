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
static NSUInteger const kTitleLabelMaxLine    = 2;

/*文本背景高度*/
static CGFloat    const kBackgroundHeight     = 41;

/*Bottom的偏移量 118是设置的高度 需要减去tabbar高度*/
static CGFloat    const kTextBottomMargin     = 118-49;//69

#define kColor_TitleLabelBackground_BlackColor ([[UIColor blackColor] colorWithAlphaComponent:0.8])
#define kColor_TitleLabelBackground_RedColor   ([UIColor colorWithRed:234.0f/255.0f green:65.0f/255.0f blue:65.0f/255.0f alpha:0.860])
#define kColor_TitleLabelTextColor             ([UIColor whiteColor])

#define kFont_TitleLabelFont_NetworkVeryBad    ([UIFont systemFontOfSize:14])
#define kFont_TitleLabelFont_Other             ([UIFont systemFontOfSize:15])

#define kTitleLabelEdgeInsets                  (UIEdgeInsetsMake(-14, -14, -14, -14))

#define kSize_LoadingSize                      ((CGSize){40,40})

#define kImage_AddImage                        ([UIImage imageNamed:@"inform_icon_add_normal"])
#define kImage_SuccessImage                    ([UIImage imageNamed:@"inform_icon_success_normal"])


#define kImage_LoadingImage \
({ \
NSString *path         = [[NSBundle mainBundle] pathForResource:@"jiuailogo_loading" ofType:@"gif"]; \
NSData *data           = [NSData dataWithContentsOfFile:path]; \
UIImage *image         = [UIImage sd_animatedGIFWithData:data]; \
image; \
});



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


#pragma mark - init

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
        case TTHUDTitleTypePostageCannotBeZero: {
            
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
                make.height.mas_equalTo(kBackgroundHeight);
                make.top.mas_equalTo(self).offset(-kBackgroundHeight);
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
        default: {
            result = @"";
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
    attch.bounds            = CGRectMake(-4, 0, 11, 11);

    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri insertAttributedString:string atIndex:0];

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
            label.preferredMaxLayoutWidth = CGRectGetWidth(self.bounds)-50;
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
    return UIEdgeInsetsInsetRect((CGRect){0,0,[super intrinsicContentSize]}, kTitleLabelEdgeInsets).size;
}

- (void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect,kTitleLabelEdgeInsets)];
}

@end
