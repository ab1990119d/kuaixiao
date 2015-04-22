//
//  ProductListView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/23.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  

#import <UIKit/UIKit.h>
#import "OrderDetail.h"
#import "PromoteProduct.h"
#import "UIButton+LXHButtonBlock.h"

@interface ProductListView : UIView

@property (nonatomic ,strong) UIButton *btn;


-(void)initViewWithProduct:(OrderDetail *)dic;

-(void)initViewWithPromoteProduct:(PromoteProduct *)product;

@end
