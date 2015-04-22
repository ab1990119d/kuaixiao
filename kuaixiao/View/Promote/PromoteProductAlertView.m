//
//  PromoteProductAlertView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "PromoteProductAlertView.h"

@implementation PromoteProductAlertView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}

-(void)initView{
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, ScreenWidth-30, 20)];
    titleLabel.text = @"商品信息";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor =  Color(11, 92, 254);
    [self addSubview:titleLabel];
    
    CGRect lineForm =CGRectMake(10, 25, ScreenWidth-30, 0.5);
    UIView *btnLineView = [[UIView alloc]initWithFrame:lineForm];
    btnLineView.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView];
    
    NSString *textStr = [[NSString alloc]initWithFormat:@"规格：%@/%@    参考价格：%.2f元",_product.specification,_product.model,_product.price];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, ScreenWidth-20, 20)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = _product.proName;
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
    numberLabel.text = @"预期销量：";
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.font = [UIFont systemFontOfSize:13.0];
    
    _numField = [[UITextField alloc]initWithFrame:CGRectMake(70, 70, 100, 60)];
    _numField.placeholder = @"点击输入数量";
    _numField.text =[AppUtiles stringFromDouble: _product.expectedSales];
    _numField.adjustsFontSizeToFitWidth = YES;
    _numField.keyboardType =UIKeyboardTypeDecimalPad;
    _numField.clearsOnBeginEditing = YES;
    _numField.delegate = self;
    _numField.tag =100;
    _numField.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:_numField];
    
    _measureBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-80, 85, 50, 30)];
    [_measureBtn setTitle:_product.origMeasureName forState:UIControlStateNormal];
    [_measureBtn.layer setMasksToBounds:YES];
    [_measureBtn.layer setBorderWidth:1.0];
    [_measureBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,-15,0,0)];
    _measureBtn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [_measureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_measureBtn];
    
    [self addSubview:numberLabel];
    
    UIView *btnLineView3 = [[UIView alloc]initWithFrame:CGRectMake(0,120, ScreenWidth-10, 0.5)];
    btnLineView3.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView3];
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,120,60, 40)];
    priceLabel.textAlignment = NSTextAlignmentLeft;
    priceLabel.text = @"促销价格:";
    priceLabel.textColor = [UIColor blackColor];
    priceLabel.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:priceLabel];
    
    _priceField = [[UITextField alloc]initWithFrame:CGRectMake(70, 110, 100, 60)];
    _priceField.text = [AppUtiles stringFromDouble:_product.origPrice];
    _priceField.keyboardType =UIKeyboardTypeDecimalPad;
    _priceField.adjustsFontSizeToFitWidth = YES;
    _priceField.clearsOnBeginEditing = YES;
    _priceField.delegate = self;
    _priceField.tag =200;
    _priceField.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:_priceField];
    
    UILabel *priceLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth-80,110,80, 60)];
    priceLabel2.textAlignment = NSTextAlignmentLeft;
    priceLabel2.text = @"元（单价）";
    priceLabel2.textColor = [UIColor blackColor];
    priceLabel2.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:priceLabel2];

    UIView *btnLineView4 = [[UIView alloc]initWithFrame:CGRectMake(0,160, ScreenWidth-10, 0.5)];
    btnLineView4.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView4];
    
    _totalLabel = [[UITextField alloc]initWithFrame:CGRectMake(10, 160, ScreenWidth-40, 40)];
    _totalLabel.textAlignment = NSTextAlignmentRight;
    _totalLabel.text = [[NSString alloc]initWithFormat:@"总金额：¥%.2f",_product.totalPrice];
    _totalLabel.textColor = [UIColor redColor];
    _totalLabel.font = [UIFont systemFontOfSize:13.0];
    _totalLabel.userInteractionEnabled = NO;
    [self addSubview:_totalLabel];
    
    UIView *btnLineView6 = [[UIView alloc]initWithFrame:CGRectMake(0,200, ScreenWidth-10, 0.5)];
    btnLineView6.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView6];
    
    UILabel *btLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, ScreenWidth-20, 60)];
    
    _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200,(ScreenWidth)/2, 50)];
    [_returnBtn setTitle:@"取消" forState:UIControlStateNormal];
    _returnBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [_returnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_returnBtn];
    
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth)/2,200,(ScreenWidth)/2, 50)];
    [_submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_submitBtn];
    
    [self addSubview:btLabel];
    
    UIView *btnLineView7 = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2,200, 0.5, 50)];
    btnLineView7.backgroundColor = Color(167, 168, 170);
    [self addSubview:btnLineView7];
    
    [_measureBtn addTarget:self action:@selector(measureClick) forControlEvents:UIControlEventTouchUpInside];
    [_submitBtn addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    [_returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)returnClick{
    if ([self.delegate respondsToSelector:@selector(retrunProductBack)]) {
        [self.delegate retrunProductBack];
    }
}

-(void)submitClick{
    _product.expectedSales = [_numField.text doubleValue];
    _product.origPrice = [_priceField.text doubleValue];
    
    if (_product.expectedSales == 0) {
        [AppUtiles showAlertMessage:@"请输入预销售数量"];
    }else if (_product.origPrice == 0) {
        [AppUtiles showAlertMessage:@"请输入促销价格"];
    }else{
        if ([self.delegate respondsToSelector:@selector(submitProductBack:)]) {
            [self.delegate submitProductBack:_product];
        }
    }
}

-(void)measureClick{
    [self initProductView];
}

- (void)initProductView{
    
    [self initBackView];
    
    float height;
    float viewHight =([_product.productMeasureList count]+1)*40 +40;
    if ([_product.productMeasureList count]+1 > 5) {
        height = 240;
    }else{
        height = viewHight ;
    }
    self.measureSheetView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth,viewHight)];
    [UIView animateWithDuration:0.5 animations:^{
        self.measureSheetView.frame = CGRectMake(0, ScreenHeight - height, ScreenWidth, height);
    }];
    self.measureSheetView.backgroundColor = [UIColor clearColor];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    topView.layer.cornerRadius = 7.0f;
    topView.layer.masksToBounds = YES;
    topView.backgroundColor = Color(205, 207, 211);
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"请选择计量单位";
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    [topView addSubview:titleLabel];
    
    [self.measureSheetView addSubview:topView];
    [self.window addSubview:self.measureSheetView];
    
    UIScrollView *btnView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth,height - 40)];
    btnView.contentSize = CGSizeMake(ScreenWidth, [_product.productMeasureList count]+1*40);
    btnView.scrollEnabled = YES;
    btnView.backgroundColor = [UIColor whiteColor];
    [self.measureSheetView addSubview:btnView];
    for (int i = 0; i < [_product.productMeasureList count]+1; i ++ ) {
        UIView *btnLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 40 *(i+1), ScreenWidth, 0.5)];
        btnLineView.backgroundColor = Color(167, 168, 170);
        [btnView addSubview:btnLineView];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 40*i, ScreenWidth, 40)];
        ProductMeasure *measure = [[ProductMeasure alloc]init];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0,-ScreenWidth/2,0,0)];
        if (i ==0) {
            [btn setTitle:[_product.measureName stringByAppendingString:@"(默认计量单位)"] forState:UIControlStateNormal];
        }else{
            measure = [_product.productMeasureList objectAtIndex:i-1];
            NSString *str = [[NSString alloc] initWithFormat:@"(1%@ = %ld%@)",measure.measureName,measure.baseMeasureConvert,_product.measureName ];
            [btn setTitle:[measure.measureName stringByAppendingString:str] forState:UIControlStateNormal];
        }
        
        if (measure.measureId == nil) {
            measure.measureName = _product.measureName;
            measure.baseMeasureConvert =1;
        }
        [btn setParam:@{@"measure":measure}];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(measurceClick:) forControlEvents:UIControlEventTouchUpInside];
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
        self.measureSheetView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, self.measureSheetView.frame.size.height);
    }];
}

- (void)measurceClick:(UIButton *)sender{
    [self removeView];
    NSMutableDictionary *parms= [(UIButton *) sender param];
    ProductMeasure  *measure = [parms objectForKey:@"measure"];
    _product.origMeasureName = measure.measureName;
    _product.origMeasureId = measure.measureId;
    _product.origPrice = _product.price*measure.baseMeasureConvert;
    _product.totalPrice= _product.origPrice;
    [self reloadView];
}

/**
 *重新加载界面
 */
-(void)reloadView{
    for(id tmpView in [self subviews])
    {
        [tmpView removeFromSuperview];
    }
    [self initView];
}

#pragma mark 计算总价
- ( BOOL )textField:( UITextField *)textField shouldChangeCharactersInRange:( NSRange )range replacementString:( NSString *)string
{
    
    textField.text = [textField.text stringByAppendingString:string];

    _product.totalPrice = [_numField.text doubleValue]*[_priceField.text doubleValue];
  
    _totalLabel.text = [[NSString alloc]initWithFormat:@"总金额：¥%.2f",_product.totalPrice];
    
    textField.text = [textField.text substringToIndex:textField.text.length-1];
    return YES;
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
