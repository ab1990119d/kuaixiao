//
//  SearchProductView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "SearchProductView.h"

@implementation SearchProductView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;

}

-(void)initView{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth - 50, 0, 50, 50)];
    backView.backgroundColor = Color(201, 201, 206);
    [self addSubview:backView];
    _scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _scanBtn.frame = CGRectMake(0,  10, 45, 30);
    [_scanBtn setImage:[UIImage imageNamed:@"ic_barcode_icon_bg_normal.png"] forState:UIControlStateNormal];
    [_scanBtn setImageEdgeInsets:UIEdgeInsetsMake(3, 6, 3, 6)];
    _scanBtn.backgroundColor = Color(244, 244, 244);
    _scanBtn.layer.cornerRadius = 4;
    _scanBtn.layer.masksToBounds = YES;
    [backView addSubview:_scanBtn];
    
    _toSearchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _toSearchBtn.frame = CGRectMake(0,  12, 45, 26);
    _toSearchBtn.backgroundColor = Color(244, 244, 244);
    _toSearchBtn.layer.cornerRadius = 4;
    _toSearchBtn.layer.masksToBounds = YES;
    _toSearchBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_toSearchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [_toSearchBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
    _toSearchBtn.hidden = YES;
    [backView addSubview:_toSearchBtn];
    
    _searchResultBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0, ScreenWidth - 50, 50)];
    [self addSubview:_searchResultBar];
}

@end
