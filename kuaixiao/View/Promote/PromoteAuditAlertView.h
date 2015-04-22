//
//  PromoteAuditAlertView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXHTextFieldView.h"
#import "UIButton+LXHButtonBlock.h"

@protocol PromoteAuditAlertViewDelegate <NSObject>

@optional
-(void)retrunBack;

@end

@interface PromoteAuditAlertView : UIView<UITextViewDelegate>


//userId - 当前登录用户Id
//promoteId - 促销Id
//state - 审批状态 state = 2审批未通过；state=3审批通过
//auditOpinion - 审批意见

@property (nonatomic, assign) id <PromoteAuditAlertViewDelegate> delegate;
/** * 确定*/
@property (nonatomic ,strong) UIButton *submitBtn;
/*** 取消*/
@property (nonatomic ,strong) UIButton *returnBtn;
/** * 通过*/
@property (nonatomic ,strong) UIButton *stateYesBtn;
/** * 不通过*/
@property (nonatomic ,strong) UIButton *stateNoBtn;
/** * 意见*/
@property (nonatomic ,strong) LXHTextFieldView *auditTxtField;


@property (nonatomic ,strong) NSString *promoteId;
@property (nonatomic ,strong) NSString *state;
@property (nonatomic ,strong) NSString *auditOpinion;


-(void)initView;


@end
