//
//  ViewController.m
//  TamAlertViewDemo
//
//  Created by xin chen on 2017/12/4.
//  Copyright © 2017年 涂怀安. All rights reserved.
//

#import "ViewController.h"
#import "TamAlertView.h"

@interface ViewController ()
- (IBAction)normalAction:(UIButton *)sender;
- (IBAction)LeftAndLeftAction:(UIButton *)sender;
- (IBAction)leftAndRightAction:(UIButton *)sender;
- (IBAction)rightAndRightAction:(UIButton *)sender;
- (IBAction)rightAndLeftAction:(UIButton *)sender;
- (IBAction)upAndDownAction:(UIButton *)sender;
- (IBAction)upAndUpAction:(UIButton *)sender;
- (IBAction)downAndDownAction:(UIButton *)sender;
- (IBAction)downAndUpAction:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)normalAction:(UIButton *)sender {
    TamAlertView *alertView = [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!\n楼主太帅了!" cancel:@"取消" sure:@"确定" animaType:NormalType cancelAction:^{
        
    } sureAction:^{
        
    }];
    alertView.contentAlignment = NSTextAlignmentLeft;
}

- (IBAction)LeftAndLeftAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:LeftAndLeftType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)leftAndRightAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:LeftAndRightType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)rightAndRightAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:RightAndRightType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)rightAndLeftAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:RightAndLeftType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)upAndDownAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:UpAndDownType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)upAndUpAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:UpAndUpType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)downAndDownAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:DownAndDownType cancelAction:^{
        
    } sureAction:^{
        
    }];
}

- (IBAction)downAndUpAction:(UIButton *)sender {
    [TamAlertView showAlertViewWithTitle:@"提示" content:@"楼主太帅了" cancel:@"取消" sure:@"确定" animaType:DownAndUpType cancelAction:^{
        
    } sureAction:^{
        
    }];
}
@end
