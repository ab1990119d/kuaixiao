//
//  OrderListView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  产品列表

#import <UIKit/UIKit.h>
#import "Compete.h"
#import "OrderListCell.h"
#import "OrderDetail.h"

@protocol OrderListViewDelegate <NSObject>

@optional

-(void)selectOrder:(OrderDetail *) detail;

@end

@interface OrderListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) id <OrderListViewDelegate> delegate;

@property (nonatomic , strong) UITableView *dataTableView;//竟品列表视图
@property (nonatomic , strong)NSArray *competes;
@property (nonatomic , strong)NSMutableArray *exclCompeteIds;

@property (nonatomic , strong) NSMutableArray *orderDetails;

@property (nonatomic , strong) UILabel *totalLabel;

@property (nonatomic ) double totalPrice;


-(void)initView;
-(void)initTotalPrice;
@end
