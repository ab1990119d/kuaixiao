//
//  OrderAuditAlertView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/25.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  订单审批的弹出框

#import <UIKit/UIKit.h>
#import "OrderAudit.h"
#import "LXHTextFieldView.h"
#import "Storehouse.h"
#import "UIButton+LXHButtonBlock.h"

@protocol OrderAuditAlertViewDelegate <NSObject>

@optional
-(void)retrunBack;

@end

@interface OrderAuditAlertView : UIView<UITextFieldDelegate>

@property (nonatomic, assign) id <OrderAuditAlertViewDelegate> delegate;
/** * 确定*/
@property (nonatomic ,strong) UIButton *submitBtn;
/*** 取消*/
@property (nonatomic ,strong) UIButton *returnBtn;
/** * 通过*/
@property (nonatomic ,strong) UIButton *stateYesBtn;
/** * 不通过*/
@property (nonatomic ,strong) UIButton *stateNoBtn;
/** * 仓库*/
@property (nonatomic ,strong) UIButton *storehouseBtn;
/** * 选择仓库View*/
@property (nonatomic ,strong) UIView *storehouseView;
/** * 意见*/
@property (nonatomic ,strong) LXHTextFieldView *auditTxtField;

@property BOOL pass;

@property (nonatomic ,strong) NSArray *stroes;

@property (nonatomic ,strong) NSString *orderId;
@property (nonatomic ,strong) NSString *storehouseId;
@property (nonatomic ,strong) NSString *state;
@property (nonatomic ,strong) NSString *auditTxt;

@property (nonatomic , strong)UIView *backView;//灰色的背景
@property (nonatomic , strong)UIView *storeSheetView;

-(void)initView;
@end
