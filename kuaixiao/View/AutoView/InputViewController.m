//
//  InputViewController.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigatinBar.delegate = self;
    [self.view addSubview:self.navigatinBar];
   
    if (_type == 1) {
        [self initBigText];
    }else if(_type == 2){
        [self initNumFiled];
    }else if(_type == 3){
        [self initTextFiled];
    }
}

- (void)initBigText{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight + 1, ScreenWidth, 140)];
    backView.backgroundColor = Color(189, 189, 195);
    [self.view addSubview:backView];
    self.importTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, NavHeight + 11, ScreenWidth - 20, 120)];
    if (self.textStr||self.textStr.length > 0) {
        self.importTextView.text = self.textStr;
    }
    self.importTextView.backgroundColor = [UIColor whiteColor];
    [self.importTextView becomeFirstResponder];
    self.importTextView.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:self.importTextView];
}
- (void)initTextFiled{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight + 1, ScreenWidth, 50)];
    backView.backgroundColor = Color(189, 189, 195);
    [self.view addSubview:backView];
    self.importTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, NavHeight + 11, ScreenWidth - 20, 30)];
    self.importTextField.backgroundColor = [UIColor whiteColor];
    self.importTextField.placeholder = @"输入内容";
    if (self.textStr||self.textStr.length > 0) {
        self.importTextField.text = self.textStr;
    }
    self.importTextField.font = [UIFont systemFontOfSize:15.0];
    self.importTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.importTextField becomeFirstResponder];
    [self.view addSubview:self.importTextField];
}

- (void)initNumFiled{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight + 1, ScreenWidth, 50)];
    backView.backgroundColor = Color(189, 189, 195);
    [self.view addSubview:backView];
    self.importTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, NavHeight + 11, ScreenWidth - 20, 30)];
    self.importTextField.backgroundColor = [UIColor whiteColor];
    self.importTextField.placeholder = @"输入内容";
    if (self.textStr||self.textStr.length > 0) {
        self.importTextField.text = self.textStr;
    }
    self.importTextField.font = [UIFont systemFontOfSize:15.0];
    self.importTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.importTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.importTextField becomeFirstResponder];
    [self.view addSubview:self.importTextField];
}
- (void)leftBtnAcion:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightBtnAcion:(id)sender{
    if (_type == 1) {
        if (self.myBlock) {
            self.myBlock(self.importTextView.text);//括号里面写传的值，直接写值就可以了。
        }
    }else{
        if (self.myBlock) {
            self.myBlock(self.importTextField.text);//括号里面写传的值，直接写值就可以了。
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - touchBegan - - 点击非textfiled的地方收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.importTextView resignFirstResponder];
    [self.importTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
