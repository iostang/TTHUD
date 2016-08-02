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
#import "TTHUDConfig.h"

@interface TTLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets borderEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets textEdgeInsets;

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

/**
 *  图片名
 */
@property (nonatomic, copy  ) NSString *imageName;

@end

@implementation TTHUDView

#pragma mark - 各种类型的HUD

/**
 *  中间文本 或者文本和图片 细条
 */
+ (instancetype)showHUDToViewCenter:(UIView *)view message:(NSString *)message
{
  return [self showHUDToViewCenter:view message:message imageName:nil];
}

/**
 *  中间文本和图片 细条
 */
+ (instancetype)showHUDToViewCenter:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeBottomMessage message:message imageName:imageName];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

/**
 *  底部文本 或者文本和图片 细条
 */
+ (instancetype)showHUDToViewBottom:(UIView *)view message:(NSString *)message
{
  return [self showHUDToViewBottom:view message:message imageName:nil];
}

/**
 *  底部文本和图片 细条
 */
+ (instancetype)showHUDToViewBottom:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeBottomMessage message:message imageName:imageName];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeBottom];
    return hud;
}

/**
 * 中间显示文本+成功图片 大方块
 */
+ (instancetype)showSuccessHUDToView:(UIView *)view message:(NSString *)message
{
    return [self showSuccessHUDToView:view message:message imageName:nil];
}

/**
 * 中间显示文本+自定义成功图片 大方块
 */
+ (instancetype)showSuccessHUDToView:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCenterSuccessMessage message:message imageName:imageName];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

/**
 * 中间显示文本+失败图片 大方块
 */
+ (instancetype)showErrorHUDToView:(UIView *)view message:(NSString *)message
{
    return [self showErrorHUDToView:view message:message imageName:nil];
}

/**
 * 中间显示文本+自定义失败图片 大方块
 */
+ (instancetype)showErrorHUDToView:(UIView *)view message:(NSString *)message imageName:(NSString *)imageName
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeCenterErrorMessage message:message imageName:imageName];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeCenter];
    return hud;
}

/**
 * 中间显示Loading的gif图 圆形
 */
+ (instancetype)showLoadingToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeLoadingMessage message:nil imageName:nil];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeLoading];
    return hud;
}

/**
 * 中间显示Loading的gif图  禁止下层级交互 圆形
 */
+ (instancetype)showDisableLoadingToView:(UIView *)view
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeLoadingMessage message:nil imageName:nil];
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
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNetworkVeryBadMessage message:@"网络有点慢，好心塞" imageName:nil];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeTop];
    return hud;
}

/**
 * 顶部显示自定义纯文本 背景色为红色 细条
 */
+ (instancetype)showNetworkToView:(UIView *)view customMessage:(NSString *)customMessage
{
    TTHUDView *hud = [[TTHUDView alloc]initWithType:TTHUDTitleTypeNetworkVeryBadMessage message:customMessage imageName:nil];
    hud.frame      = view.bounds;
    [view tt_showHUD:hud type:TTHUDTypeTop];
    return hud;
}


#pragma mark - init

- (instancetype)initWithType:(TTHUDShowType)type message:(NSString *)message imageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.imageName = imageName;
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
            
            [self labelTitleAttributedText];
            
            [self addSubview:self.titleLabel];

            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
            }];
        }
            break;
            
        case TTHUDTitleTypeBottomMessage: {
            
            [self labelTitleAttributedText];
            
            [self addSubview:self.titleLabel];

            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-kTextBottomMargin);
                make.centerX.mas_equalTo(self);
            }];
        }
            break;
            
        case TTHUDTitleTypeCenterSuccessMessage:
        case TTHUDTitleTypeCenterErrorMessage: {
            
            [self labelTitleAttributedText];
            [self addSubview:self.titleLabel];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
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

- (void)labelTitleAttributedText
{
    // 创建一个富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.message];

    if (self.imageName) {
        
        //添加图片
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image             = kImage_CustomImage(self.imageName);
        attch.bounds            = CGRectMake(0, 0, attch.image.size.width, attch.image.size.width);
        
        // 创建带有图片的富文本
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];

        NSAttributedString *place;
        if (self.type == TTHUDTitleTypeCenterSuccessMessage || self.type == TTHUDTitleTypeCenterErrorMessage) {
            place = [[NSAttributedString alloc] initWithString:@"\n\n"];
        } else {
            place = [[NSAttributedString alloc] initWithString:@"  "];
        }
        
        [attri insertAttributedString:string atIndex:0];
        [attri insertAttributedString:place atIndex:1];
    }
    
    self.titleLabel.attributedText = attri;
}

#pragma mark - lazy load

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            
            TTLabel *label = [TTLabel new];
            if (self.type == TTHUDTitleTypeCenterSuccessMessage || self.type == TTHUDTitleTypeCenterErrorMessage) {
                label.preferredMaxLayoutWidth = kTitleLabel_PreferredMaxLayoutWidth_CenterHUD;
                label.borderEdgeInsets        = kTitleLabelBorderEdgeInsets;
                label.textEdgeInsets          = UIEdgeInsetsMake(kNumber_InsetsNumber, kNumber_InsetsNumber-4, kNumber_InsetsNumber, kNumber_InsetsNumber-4);
                label.numberOfLines           = kTitleLabelMaxLine_CenterHUD;
            } else {
                label.borderEdgeInsets        = kTitleLabelBorderEdgeInsets;
                label.textEdgeInsets          = kTitleLabelTextEdgeInsets;
                label.preferredMaxLayoutWidth = kTitleLabel_PreferredMaxLayoutWidth;
                label.numberOfLines           = kTitleLabelMaxLine;
            }
            
            label.textColor               = kColor_TitleLabelTextColor;
            label.backgroundColor         = kColor_TitleLabelBackground_BlackColor;
            label.font                    = kFont_TitleLabelFont_Other;
            label.textAlignment           = NSTextAlignmentCenter;
            label.layer.cornerRadius      = 5;
            label.layer.masksToBounds     = YES;
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
    return UIEdgeInsetsInsetRect((CGRect){0,0,[super intrinsicContentSize]}, self.borderEdgeInsets).size;
}

- (void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect,self.textEdgeInsets)];
}

@end
