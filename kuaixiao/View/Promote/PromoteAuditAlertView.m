//
//  PromoteAuditAlertView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "PromoteAuditAlertView.h"

@implementation PromoteAuditAlertView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)initView{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, ScreenWidth-30, 40)];
    titleLabel.text = @"促销审批";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor =  Color(11, 92, 254);
    [self addSubview:titleLabel];
    
    CGRect lineForm =CGRectMake(10, 45, ScreenWidth-30, 0.5);
    UIView *btnLineView = [[UIView alloc]initWithFrame:lineForm];
    btnLineView.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView];
    
    _stateYesBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 50,80, 40)];
    [_stateYesBtn setTitle:@"通过" forState:UIControlStateNormal];
    [_stateYesBtn setTitleColor: Color(11, 92, 254) forState:UIControlStateNormal];
    [_stateYesBtn setTitle:@"通过" forState:UIControlStateSelected];
    [_stateYesBtn setTitleColor: Color(11, 92, 254) forState:UIControlStateSelected];
    [_stateYesBtn setImage:[UIImage imageNamed:@"unselected@2x"] forState:UIControlStateNormal];
    [_stateYesBtn setImage:[UIImage imageNamed:@"isselected@2x"] forState:UIControlStateSelected];
    [_stateYesBtn setImageEdgeInsets:UIEdgeInsetsMake(0,-10,0,0)];
    [self addSubview:_stateYesBtn];
    
    _stateNoBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 50,100, 40)];
    [_stateNoBtn setTitle:@"不通过" forState:UIControlStateNormal];
    [_stateNoBtn setTitleColor: Color(11, 92, 254) forState:UIControlStateNormal];
    [_stateNoBtn setTitle:@"不通过" forState:UIControlStateSelected];
    [_stateNoBtn setTitleColor: Color(11, 92, 254) forState:UIControlStateSelected];
    [_stateNoBtn setImage:[UIImage imageNamed:@"unselected@2x"] forState:UIControlStateNormal];
    [_stateNoBtn setImage:[UIImage imageNamed:@"isselected@2x"] forState:UIControlStateSelected];
    [_stateNoBtn setImageEdgeInsets:UIEdgeInsetsMake(0,-10,0,0)];
    [self addSubview:_stateNoBtn];
    
    _stateYesBtn.selected = YES;
    _state = @"2";
  
    _auditTxtField = [[LXHTextFieldView alloc]initWithFrame:CGRectMake(10, 95,ScreenWidth-30, 140) limitNumber:120];
    
    _auditTxtField.placeholder = @"请输入审批意见";
    
    [self addSubview:_auditTxtField];
    
    UIView *btnLineView6 = [[UIView alloc]initWithFrame:CGRectMake(0,240, ScreenWidth-10, 0.5)];
    btnLineView6.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView6];
    
    UILabel *btLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 240, ScreenWidth-20, 60)];
    _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 245,(ScreenWidth-20)/2, 60)];
    [_returnBtn setTitle:@"取消" forState:UIControlStateNormal];
    _returnBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [_returnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_returnBtn];
    
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth-20)/2,245,(ScreenWidth-20)/2, 60)];
    [_submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_submitBtn];
    
    [self addSubview:btLabel];
    
    UIView *btnLineView7 = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2,240, 0.5, 60)];
    btnLineView7.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView7];
    
    
    [_stateYesBtn addTarget:self action:@selector(stateYesClick) forControlEvents:UIControlEventTouchUpInside];
    [_stateNoBtn addTarget:self action:@selector(stateNoClick) forControlEvents:UIControlEventTouchUpInside];
    [_submitBtn addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    [_returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)returnClick{
    if ([self.delegate respondsToSelector:@selector(retrunBack)]) {
        [self.delegate retrunBack];
    }
}

-(void)submitClick{
    if (_auditTxtField.textView.text.length == 0) {
        [AppUtiles showErrorMessage:@"请填写审批意见"];
    }else {
        _auditOpinion =_auditTxtField.textView.text;
        [self saveAudit];
        if ([self.delegate respondsToSelector:@selector(retrunBack)]) {
            [self.delegate retrunBack];
        }
    }
    
}

-(void)stateYesClick{
    _stateYesBtn.selected = YES;
    _stateNoBtn.selected = NO;
    _state = @"2";
}

-(void)stateNoClick{
    _stateNoBtn.selected = YES;
    _stateYesBtn.selected = NO;
    _state = @"3";
}

-(void)saveAudit{
//    userId - 当前登录用户Id
//    promoteId - 促销Id
//    state - 审批状态 state = 2审批未通过；state=3审批通过
//    auditOpinion - 审批意见
    
    NSString *userId = [UserDefaultsUtils valueWithKey:@"userId"];
    NSDictionary *parameters =  @{@"userId":userId,@"promoteId":_promoteId,@"state":_state,@"auditOpinion":_auditOpinion};
    NSString * urlStr = @"/promate/saveAuditPromate.do";
    CommonHandler *handler = [[CommonHandler alloc]init];
    
    handler.client.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    handler.client.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    SuccessBlock success = ^(id obj){
        NSDictionary *result = obj;
        NSString *msg = [result valueForKey:@"msg"];
        [AppUtiles showAlertMessage:msg];
        [AppUtiles dismissHUD];
    };
    
    FailedBlock failed = ^(id obj){
        [AppUtiles showNetErrorMessage];
    };
    [handler requestData:parameters requestUrl:urlStr success:success failed:failed];
}

//点击屏幕，让键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
@end
