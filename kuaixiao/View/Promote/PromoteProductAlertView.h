//
//  PromoteProductAlertView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromoteProduct.h"
#import "ProductMeasure.h"
#import "UIButton+LXHButtonBlock.h"

@protocol PromoteProductAlertViewDelegate <NSObject>

@optional
-(void)retrunProductBack;

-(void)submitProductBack:(PromoteProduct *) product;

@end
@interface PromoteProductAlertView : UIView<UITextFieldDelegate>
@property (nonatomic, assign) id <PromoteProductAlertViewDelegate> delegate;
/**
 * 确定
 */
@property (nonatomic ,strong) UIButton *submitBtn;
/**
 * 规格
 */
@property (nonatomic ,strong) UIButton *measureBtn;
/**
 * 取消
 */
@property (nonatomic ,strong) UIButton *returnBtn;
/**
 * 价格
 */
@property (nonatomic ,strong)UITextField *priceField;
/**
 * 数量
 */
@property (nonatomic ,strong)UITextField *numField;
@property (nonatomic , strong)UIView *backView;//灰色的背景
@property (nonatomic , strong)UIView *measureSheetView;
@property(nonatomic , strong)UITextField *totalLabel;
@property (nonatomic ,strong)PromoteProduct *product;
-(void)initView;
@end
