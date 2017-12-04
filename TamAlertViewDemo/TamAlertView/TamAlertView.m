//
//  TamAlertView.m
//  LotteryApp
//
//  Created by xin chen on 2017/11/24.
//  Copyright © 2017年 涂怀安. All rights reserved.
//

#import "TamAlertView.h"
#import "TamBgkView.h"
#import "UIView+Tam.h"

static const CGFloat TamM = 20;//左右两边间距
static const CGFloat BtnH = 50;//按钮高
static const CGFloat TitleH = 30;//主题高
static const CGFloat TitleM = 10;//主题上下间距
static const CGFloat ContentM = 20;//内容上下间距
static const CGFloat ContentLM = 5;//内容左右间距
static const CGFloat LineM = 0.5;//线的大小

static const CGFloat AnimTime = 1.0;//动画时间

#define MAXH (TamScreenH-30*2)//最高限制

@interface TamAlertView()

@property(nonatomic,copy)ClickBlock clickCancel;
@property(nonatomic,copy)ClickBlock clickSure;

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *cancel;
@property(nonatomic,copy)NSString *sure;

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,assign)TamAnimaType animaType;

@end

@implementation TamAlertView

-(void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
    self.contentLabel.textColor = _contentColor;
}

-(void)setContentFont:(UIFont *)contentFont
{
    _contentFont = contentFont;
    self.contentLabel.font = _contentFont;
}

-(void)setContentAlignment:(NSTextAlignment)contentAlignment
{
    _contentAlignment = contentAlignment;
    self.contentLabel.textAlignment = _contentAlignment;
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.titleLabel.textColor = _titleColor;
}

-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.titleLabel.font = _titleFont;
}

+(TamAlertView *)showAlertViewWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancel sure:(NSString *)sure animaType:(TamAnimaType)animaType cancelAction:(ClickBlock)cancelAction sureAction:(ClickBlock)sureAction
{
    TamAlertView *_alertView = [[TamAlertView alloc]init];
    _alertView.userInteractionEnabled = YES;
    //风格
    _alertView.layer.masksToBounds = YES;
    _alertView.layer.cornerRadius = 5;
    _alertView.backgroundColor = [UIColor whiteColor];
    
    _alertView.animaType = animaType;
    _alertView.clickSure = sureAction;
    _alertView.clickCancel = cancelAction;
    _alertView.title = title;
    _alertView.content = content;
    _alertView.cancel = cancel;
    _alertView.sure = sure;
    [_alertView setupUI];
    
    //展示
    //背景
    [TamBgkView showBgkViewInView:key_window isEnable:YES isTouchHidden:NO touchBgkViewBlock:^{
        
    }];
    
    //主页面
    _alertView.frame = [_alertView getRect];
    [key_window addSubview:_alertView];
    
    [_alertView showAnim];
    
    return _alertView;
}

-(BOOL) isEmpty:(id) content {
    if (!content) {
        return YES;
    }
    if ([content isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSString *newContent = [NSString stringWithFormat:@"%@",content];
    if(newContent.length == 0) {
        return YES;
    }
    return NO;
}

-(CGSize)getViewSizeWithLabel:(UILabel *)label size:(CGSize)size
{
    NSDictionary *attrs = @{NSFontAttributeName : label.font};
    return [label.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(CGRect)getRect
{
    CGFloat vH = ([self isEmpty:self.title] ? 0 : (TitleH+TitleM*2+LineM))+[self getViewSizeWithLabel:self.contentLabel size:CGSizeMake(TamScreenW-TamM*2-ContentLM*2, MAXFLOAT)].height+5+ContentM*2+LineM+BtnH;
    CGRect rect = CGRectMake(TamM, (TamScreenH-MIN(vH, MAXH))/2, TamScreenW-TamM*2, MIN(vH, MAXH));
    switch (self.animaType) {
        case NormalType:
        {
            
        }
            break;
        case LeftAndRightType:
        {
            rect.origin.x = -rect.size.width;
        }
            break;
        case LeftAndLeftType:
        {
            rect.origin.x = -rect.size.width;
        }
            break;
        case RightAndRightType:
        {
            rect.origin.x = TamScreenW;
        }
            break;
        case RightAndLeftType:
        {
            rect.origin.x = TamScreenW;
        }
            break;
        case UpAndDownType:
        {
            rect.origin.y = -rect.size.height;
        }
            break;
        case UpAndUpType:
        {
            rect.origin.y = -rect.size.height;
        }
            break;
        case DownAndUpType:
        {
            rect.origin.y = TamScreenH;
        }
            break;
        case DownAndDownType:
        {
            rect.origin.y = TamScreenH;
        }
            break;
        default:
            break;
    }
    return rect;
}

-(void)showAnim
{
    switch (self.animaType) {
        case NormalType:
        {
            
        }
            break;
        case LeftAndRightType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = TamM;
            }];
        }
            break;
        case LeftAndLeftType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = TamM;
            }];
        }
            break;
        case RightAndRightType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = TamM;
            }];
        }
            break;
        case RightAndLeftType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = TamM;
            }];
        }
            break;
        case UpAndDownType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = (TamScreenH-self.height)/2;
            }];
        }
            break;
        case UpAndUpType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = (TamScreenH-self.height)/2;
            }];
        }
            break;
        case DownAndUpType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = (TamScreenH-self.height)/2;
            }];
        }
            break;
        case DownAndDownType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = (TamScreenH-self.height)/2;
            }];
        }
            break;
        default:
            break;
    }
}

-(void)hiddenAnim
{
    switch (self.animaType) {
        case NormalType:
        {
            [self removeFromSuperview];
        }
            break;
        case LeftAndRightType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = TamScreenW;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case LeftAndLeftType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = -self.width;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case RightAndRightType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = TamScreenW;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case RightAndLeftType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.x = -self.width;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case UpAndDownType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = TamScreenH;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case UpAndUpType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = -self.height;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case DownAndUpType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = -self.height;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case DownAndDownType:
        {
            [UIView animateWithDuration:AnimTime animations:^{
                self.y = TamScreenH;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        default:
            break;
    }
}

-(void)dismissView
{
    [TamBgkView hiddenBgkViewInView:key_window];
    
    [self hiddenAnim];
}

-(void)setupUI
{
    //主题
    UILabel *titleLabel = nil;
    if (![self isEmpty:self.title]) {
        titleLabel = [[UILabel alloc]init];
        self.titleLabel = titleLabel;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.text = self.title;
        titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:titleLabel];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-TitleM-[titleLabel(TitleH)]" options:0 metrics:@{@"TitleM":@(TitleM),@"TitleH":@(TitleH)} views:NSDictionaryOfVariableBindings(titleLabel)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-ContentLM-[titleLabel]-ContentLM-|" options:0 metrics:@{@"ContentLM":@(ContentLM)} views:NSDictionaryOfVariableBindings(titleLabel)]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    }
    //线
    UIView *lineView = nil;
    if (titleLabel) {
        lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
        [self addSubview:lineView];
        lineView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lineView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lineView)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel]-TitleM-[lineView(LineM)]" options:0 metrics:@{@"TitleM":@(TitleM),@"LineM":@(LineM)} views:@{@"lineView":lineView,@"titleLabel":titleLabel}]];
    }

    //按钮
    UIButton *cancelBtn = nil;
    if (![self isEmpty:self.cancel]) {
        cancelBtn = [[UIButton alloc]init];
        self.leftBtn = cancelBtn;
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [cancelBtn setTitleColor:[UIColor colorWithRed:61/255.0 green:182/255.0 blue:251/255.0 alpha:1] forState:UIControlStateNormal];
        [cancelBtn setTitle:self.cancel forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelBtn];
        cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cancelBtn]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(cancelBtn)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cancelBtn(BtnH)]-0-|" options:0 metrics:@{@"BtnH":@(BtnH)} views:NSDictionaryOfVariableBindings(cancelBtn)]];
    }
    
    UIView *lineView3 = nil;
    if (cancelBtn) {
        lineView3 = [[UIView alloc]init];
        lineView3.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
        [self addSubview:lineView3];
        lineView3.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView3(==cancelBtn)]-0-|" options:0 metrics:nil views:@{@"lineView3":lineView3,@"cancelBtn":cancelBtn}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lineView3(LineM)]" options:0 metrics:@{@"LineM":@(LineM)} views:NSDictionaryOfVariableBindings(lineView3)]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    }
    
    UIButton *sureBtn = [[UIButton alloc]init];
    self.rightBtn = sureBtn;
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [sureBtn setTitleColor:[UIColor colorWithRed:61/255.0 green:182/255.0 blue:251/255.0 alpha:1] forState:UIControlStateNormal];
    [sureBtn setTitle:self.sure forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureBtn];
    sureBtn.translatesAutoresizingMaskIntoConstraints = NO;
    if (cancelBtn) {
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[cancelBtn]-0-[sureBtn(==cancelBtn)]-0-|" options:0 metrics:nil views:@{@"sureBtn":sureBtn,@"cancelBtn":cancelBtn}]];
    }else{
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[sureBtn]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(sureBtn)]];
    }
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[sureBtn(BtnH)]-0-|" options:0 metrics:@{@"BtnH":@(BtnH)} views:NSDictionaryOfVariableBindings(sureBtn)]];
    
    //线
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    [self addSubview:lineView2];
    lineView2.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lineView2]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lineView2)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView2(LineM)]-0-[sureBtn]" options:0 metrics:@{@"LineM":@(LineM)} views:@{@"sureBtn":sureBtn,@"lineView2":lineView2}]];
    
    //内容扩展
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.alwaysBounceVertical = NO;
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-ContentLM-[scrollView]-ContentLM-|" options:0 metrics:@{@"ContentLM":@(ContentLM)} views:NSDictionaryOfVariableBindings(scrollView)]];
    if (lineView) {
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView]-ContentM-[scrollView]-ContentM-[lineView2]" options:0 metrics:@{@"ContentM":@(ContentM)} views:@{@"lineView":lineView,@"scrollView":scrollView,@"lineView2":lineView2}]];
    }else{
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-ContentM-[scrollView]-ContentM-[lineView2]" options:0 metrics:@{@"ContentM":@(ContentM)} views:@{@"scrollView":scrollView,@"lineView2":lineView2}]];
    }

    //内容
    UILabel *contentLabel = [[UILabel alloc]init];
    self.contentLabel = contentLabel;
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    contentLabel.text = self.content;
    contentLabel.font = [UIFont systemFontOfSize:17];
    [scrollView addSubview:contentLabel];
    contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[contentLabel]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentLabel)]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[contentLabel]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentLabel)]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contentLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];

}

-(void)cancelAction:(UIButton *)sender
{
    if (self.clickCancel) {
        self.clickCancel();
    }
    [self dismissView];
}

-(void)sureAction:(UIButton *)sender
{
    if (self.clickSure) {
        self.clickSure();
    }
    [self dismissView];
}

@end
