//
//  ProductAlertView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/23.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  订单添加时的弹出框

#import <UIKit/UIKit.h>
#import "OrderDetail.h"
#import "UIButton+LXHButtonBlock.h"

@protocol ProductAlertViewDelegate <NSObject>

@optional
-(void)retrunBack;

-(void)submitBack:(OrderDetail *) order;

@end

@interface ProductAlertView : UIView<UITextFieldDelegate>
@property (nonatomic, assign) id <ProductAlertViewDelegate> delegate;
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
 * 折扣
 */
@property (nonatomic ,strong) UIButton *disBtn;
/**
 * 减价
 */
@property (nonatomic ,strong) UIButton *downBtn;
/**
 * 价格
 */
@property (nonatomic ,strong)UITextField *priceField;
/**
 * 优惠
 */
@property (nonatomic ,strong)UITextField *prefField;
/**
 * 数量
 */
@property (nonatomic ,strong)UITextField *numField;
@property (nonatomic , strong)UIView *backView;//灰色的背景
@property (nonatomic , strong)UIView *measureSheetView;
@property(nonatomic , strong)UITextField *totalLabel;
@property (nonatomic ,strong)OrderDetail *order;
-(void)initView;

@end
