//
//  SearchProductView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchProductView : UIView<UISearchBarDelegate>

@property (nonatomic , strong) UISearchBar * searchResultBar;//搜索框
@property (nonatomic , strong) UIButton *scanBtn;//扫描按钮
@property (nonatomic , strong) UIButton *toSearchBtn;//确认搜索按钮

-(void)initView;
@end
