//
//  OrderAuditAlertView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/25.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "OrderAuditAlertView.h"

@implementation OrderAuditAlertView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _pass =YES;
    }
    return self;
}

-(void)initView{
    _storehouseId = nil;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, ScreenWidth-30, 40)];
    titleLabel.text = @"订单审批";
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
    
    if (_pass) {
        _stateYesBtn.selected = YES;
        _state = @"2";
    }else{
        _stateNoBtn.selected = YES;
        _state = @"3";
        _storehouseId =@"";
    }
    
      if (_pass) {
          _auditTxtField = [[LXHTextFieldView alloc]initWithFrame:CGRectMake(10, 95,ScreenWidth-30, 100) limitNumber:120];
      }else{
          _auditTxtField = [[LXHTextFieldView alloc]initWithFrame:CGRectMake(10, 95,ScreenWidth-30, 140) limitNumber:120];
      }
    
    _auditTxtField.placeholder = @"请输入审批意见";
    
    [self addSubview:_auditTxtField];
    
    if (_pass) {
        [self initStoreView];
        [self addSubview:_storehouseView];
    }
    
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

-(void)initStoreView{
    _storehouseView = [[UIView alloc]initWithFrame:CGRectMake(10, 200,ScreenWidth-30, 40)];
    UILabel *storehouseLabe = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    storehouseLabe.text = @"选择出货仓库：";
    storehouseLabe.textColor = [UIColor blackColor];
    storehouseLabe.font = [UIFont systemFontOfSize:13.0];
    [_storehouseView addSubview:storehouseLabe];
    
    _storehouseBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 10,100, 20)];
    [_storehouseBtn setTitle:@"请选择仓库" forState:UIControlStateNormal];
    [_storehouseBtn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
    [_storehouseBtn.layer setMasksToBounds:YES];
    [_storehouseBtn.layer setBorderWidth:1.0];
    //    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    //    [_storehouseBtn.layer setBorderColor: colorref];
    [_storehouseBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,-15,0,0)];
    [_storehouseBtn setFont:[UIFont systemFontOfSize:13.0]];
    [_storehouseView addSubview:_storehouseBtn];
    [_storehouseBtn addTarget:self action:@selector(storehouseClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)returnClick{
    if ([self.delegate respondsToSelector:@selector(retrunBack)]) {
        [self.delegate retrunBack];
    }
}

-(void)submitClick{
    
    if (_auditTxtField.textView.text.length == 0) {
        [AppUtiles showErrorMessage:@"请填写审批意见"];
    }else if(_pass && _storehouseId== nil){
        [AppUtiles showErrorMessage:@"请选择出货仓库"];
    }else {
        _auditTxt =_auditTxtField.textView.text;
        [self saveAudit];
    }
}

-(void)stateYesClick{
    _pass = YES;
    [self reloadView];
}

-(void)stateNoClick{
    _pass =NO;
    [self reloadView];
}

-(void)storehouseClick{
    [self loadStorehouse];
}

-(void)storeClick:(UIButton *) btn{
    [self removeView];
    NSMutableDictionary *parms= [(UIButton *) btn param];
    Storehouse  *store = [parms objectForKey:@"store"];
    
    [_storehouseBtn setTitle:store.storehouseName forState:UIControlStateNormal];
    _storehouseId = store.storehouseId;
}

-(void)loadStorehouse{
    NSString *userId = [UserDefaultsUtils valueWithKey:@"userId"];
    NSDictionary *parameters =  @{@"userId":userId};
    NSString * urlStr = @"/storehouse/list.do";
    CommonHandler *handler = [[CommonHandler alloc]init];
    SuccessBlock success = ^(id obj){
        _stroes = [Storehouse objectArrayWithKeyValuesArray:obj];
        [AppUtiles dismissHUD];
        [self initStorehouseView];
    };
    FailedBlock failed = ^(id obj){
        [AppUtiles showNetErrorMessage];
    };
    [handler requestData:parameters requestUrl:urlStr success:success failed:failed];
}

-(void)saveAudit{
//    userId - 审批人Id
//    orderId - 订单Id
//    state - 审批状态 ，state=2订单审批通过，state=3订单审批未通过
//    auditTxt - 订单审批意见
//    storehouseId - 仓库Id
  
    NSString *userId = [UserDefaultsUtils valueWithKey:@"userId"];
    NSDictionary *parameters =  @{@"userId":userId,@"orderId":_orderId,@"state":_state,@"auditTxt":_auditTxt,@"storehouseId":_storehouseId};
    NSString * urlStr = @"/order/saveOrderAudit.do";
    CommonHandler *handler = [[CommonHandler alloc]init];
    
    handler.client.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    handler.client.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    SuccessBlock success = ^(id obj){
        NSDictionary *result = obj;
        NSString *msg = [result valueForKey:@"msg"];
        [AppUtiles showAlertMessage:msg];
        [AppUtiles dismissHUD];
        if ([self.delegate respondsToSelector:@selector(retrunBack)]) {
            [self.delegate retrunBack];
        }
    };
  
    FailedBlock failed = ^(id obj){
        [AppUtiles showNetErrorMessage];
    };
    [handler requestData:parameters requestUrl:urlStr success:success failed:failed];
}

-(void)initStorehouseView{
    [self initBackView];
    
    float height;
    float viewHight =([_stroes count])*40 +40;
    if ([_stroes count] > 5) {
        height = 240;
    }else{
        height = viewHight ;
    }
    self.storeSheetView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth,viewHight)];
    [UIView animateWithDuration:0.5 animations:^{
        self.storeSheetView.frame = CGRectMake(0, ScreenHeight - height, ScreenWidth, height);
    }];
    self.storeSheetView.backgroundColor = [UIColor clearColor];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    topView.layer.cornerRadius = 7.0f;
    topView.layer.masksToBounds = YES;
    topView.backgroundColor = Color(205, 207, 211);
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"请选择出货仓库";
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    [topView addSubview:titleLabel];
    
    [self.storeSheetView addSubview:topView];
    [self.window addSubview:self.storeSheetView];
    
    UIScrollView *btnView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth,height - 40)];
    btnView.contentSize = CGSizeMake(ScreenWidth, [_stroes count]*40);
    btnView.scrollEnabled = YES;
    btnView.backgroundColor = [UIColor whiteColor];
    [self.storeSheetView addSubview:btnView];
    for (int i = 0; i < [_stroes count]; i ++ ) {
        UIView *btnLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 40 *(i+1), ScreenWidth, 0.5)];
        btnLineView.backgroundColor = Color(167, 168, 170);
        [btnView addSubview:btnLineView];
        
        Storehouse *store = [_stroes objectAtIndex:i];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 40*i, ScreenWidth, 40)];
        [btn setTitle:store.storehouseName  forState:UIControlStateNormal];
        [btn setParam:@{@"store":store}];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(storeClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnView addSubview:btn];
    }
}

- (void)initBackView{
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.backView.alpha = 0.6;
    self.backView.backgroundColor = [UIColor blackColor];
    [self.window addSubview:self.backView];
    UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
    [self.backView addGestureRecognizer:portraitTap];
}

- (void)removeView{
    [self.backView removeFromSuperview];
    [UIView animateWithDuration:0.5 animations:^{
        self.storeSheetView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, self.storeSheetView.frame.size.height);
    }];
}

/**
 *重新加载界面
 */
-(void)reloadView{
    [AppUtiles removeAllSubView:self];
    [self initView];
}


//点击屏幕，让键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
