//
//  PromoteGoodAlertView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+LXHButtonBlock.h"
#import "PromoteGood.h"
@protocol PromoteGoodAlertViewDelegate <NSObject>

@optional
-(void)retrunGoodBack;

-(void)submitGoodBack:(PromoteGood *) good;

@end

@interface PromoteGoodAlertView : UIView<UITextFieldDelegate>
@property (nonatomic, assign) id <PromoteGoodAlertViewDelegate> delegate;
/**
 * 确定
 */
@property (nonatomic ,strong) UIButton *submitBtn;
/**
 * 取消
 */
@property (nonatomic ,strong) UIButton *returnBtn;
/**
 * 花费
 */
@property (nonatomic ,strong)UITextField *priceField;
/**
 * 数量
 */
@property (nonatomic ,strong)UITextField *numField;

@property (nonatomic ,strong)PromoteGood *good;
-(void)initView;


@end
