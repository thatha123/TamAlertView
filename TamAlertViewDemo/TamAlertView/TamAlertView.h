//
//  TamAlertView.h
//  LotteryApp
//
//  Created by xin chen on 2017/11/24.
//  Copyright © 2017年 涂怀安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^ClickBlock)();

//动画方向
typedef enum : NSUInteger {
    NormalType = 0,
    LeftAndRightType,
    LeftAndLeftType,
    RightAndRightType,
    RightAndLeftType,
    UpAndDownType,
    UpAndUpType,
    DownAndUpType,
    DownAndDownType,
} TamAnimaType;

@interface TamAlertView : UIView

+(TamAlertView *)showAlertViewWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancel sure:(NSString *)sure animaType:(TamAnimaType)animaType cancelAction:(ClickBlock)cancelAction sureAction:(ClickBlock)sureAction;

//内容的字体颜色
@property(nonatomic,copy)UIColor *contentColor;
//内容的字体大小
@property(nonatomic,copy)UIFont *contentFont;
//内容对齐
@property(nonatomic,assign)NSTextAlignment contentAlignment;
//主题颜色
@property(nonatomic,copy)UIColor *titleColor;
//主题字体大小
@property(nonatomic,copy)UIFont *titleFont;
//左边按钮
@property(nonatomic,strong)UIButton *leftBtn;
//右边按钮
@property(nonatomic,strong)UIButton *rightBtn;

@end
