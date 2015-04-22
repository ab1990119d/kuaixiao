//
//  PromoteGoodAlertView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "PromoteGoodAlertView.h"

@implementation PromoteGoodAlertView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}

-(void)initView{
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, ScreenWidth-30, 20)];
    titleLabel.text = @"促销物料信息";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor =  Color(11, 92, 254);
    [self addSubview:titleLabel];
    
    CGRect lineForm =CGRectMake(10, 25, ScreenWidth-30, 0.5);
    UIView *btnLineView = [[UIView alloc]initWithFrame:lineForm];
    btnLineView.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView];
    
    NSString *textStr = [[NSString alloc]initWithFormat:@"类型：%@",_good.goodTypeDisplay];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, ScreenWidth-20, 20)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = _good.goodName;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:14.0];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, ScreenWidth-20, 20)];
    textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.text = textStr;
    textLabel.textColor = [UIColor lightGrayColor];
    textLabel.font = [UIFont systemFontOfSize:12.0];
    
    UIView *productDetail = [[UIView alloc]initWithFrame:CGRectMake(0, 25, ScreenWidth-10, 50)];
    [productDetail addSubview:nameLabel];
    [productDetail addSubview:textLabel];
    [self addSubview:productDetail];
    
    UIView *btnLineView2 = [[UIView alloc]initWithFrame:CGRectMake(0,80, ScreenWidth-10, 0.5)];
    btnLineView2.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView2];
    
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, ScreenWidth-30, 40)];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    numberLabel.text = @"数  量：";
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.font = [UIFont systemFontOfSize:13.0];
    
    _numField = [[UITextField alloc]initWithFrame:CGRectMake(70, 70, 100, 60)];
    _numField.placeholder = @"点击输入数量";
    _numField.text =_good.num;
    _numField.adjustsFontSizeToFitWidth = YES;
    _numField.keyboardType =UIKeyboardTypeDecimalPad;
    _numField.clearsOnBeginEditing = YES;
    _numField.delegate = self;
    _numField.tag =100;
    _numField.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:_numField];
       
    [self addSubview:numberLabel];
    
    UIView *btnLineView3 = [[UIView alloc]initWithFrame:CGRectMake(0,120, ScreenWidth-10, 0.5)];
    btnLineView3.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView3];
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,120,60, 40)];
    priceLabel.textAlignment = NSTextAlignmentLeft;
    priceLabel.text = @"花  费:";
    priceLabel.textColor = [UIColor blackColor];
    priceLabel.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:priceLabel];
    
    _priceField = [[UITextField alloc]initWithFrame:CGRectMake(70, 110, 100, 60)];
    _priceField.placeholder = @"点击输入价格";
    _priceField.text = [AppUtiles stringFromDouble:_good.price];
    _priceField.keyboardType =UIKeyboardTypeDecimalPad;
    _priceField.adjustsFontSizeToFitWidth = YES;
    _priceField.clearsOnBeginEditing = YES;
    _priceField.delegate = self;
    _priceField.tag =200;
    _priceField.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:_priceField];
    
    UIView *btnLineView4 = [[UIView alloc]initWithFrame:CGRectMake(0,160, ScreenWidth-10, 0.5)];
    btnLineView4.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView4];
 
    UILabel *btLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 160, ScreenWidth-20, 60)];
    
    _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 160,(ScreenWidth)/2, 50)];
    [_returnBtn setTitle:@"取消" forState:UIControlStateNormal];
    _returnBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [_returnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_returnBtn];
    
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth)/2,160,(ScreenWidth)/2, 50)];
    [_submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_submitBtn];
    
    [self addSubview:btLabel];
    
    UIView *btnLineView7 = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2,160, 0.5, 50)];
    btnLineView7.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView7];
    
    [_submitBtn addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    [_returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)returnClick{
    if ([self.delegate respondsToSelector:@selector(retrunGoodBack)]) {
        [self.delegate retrunGoodBack];
    }
}

-(void)submitClick{
    _good.num =_numField.text;
    _good.price = [_priceField.text doubleValue];
    
    if (_good.num.length == 0) {
        [AppUtiles showAlertMessage:@"请输入数量"];
    }else if ( _good.price == 0) {
        [AppUtiles showAlertMessage:@"请输入花费"];
    }else{
        if ([self.delegate respondsToSelector:@selector(submitGoodBack:)]) {
            [self.delegate submitGoodBack:_good];
        }
    }
}

#pragma mark-------UITextFieldDelegate(textField)移动
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - 100, self.frame.size.width, self.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
}
//在UITextField 编辑完成调用方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + 100, self.frame.size.width, self.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
}

//点击屏幕，让键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}


@end
