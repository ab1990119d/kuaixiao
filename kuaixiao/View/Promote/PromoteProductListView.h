//
//  PromoteProductListView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListCell.h"
#import "PromoteProduct.h"
#import "UIButton+LXHButtonBlock.h"

@protocol PromoteProductListViewDelegate <NSObject>

@optional

-(void)selectProduct:(PromoteProduct *) product;
-(void)deleteProduct;

@end
@interface PromoteProductListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) id <PromoteProductListViewDelegate> delegate;

@property (nonatomic , strong) UITableView *dataTableView;//竟品列表视图

@property (nonatomic , strong) NSMutableArray *orderDetails;

@property (nonatomic , strong) UILabel *totalLabel;

@property (nonatomic ) double totalPrice;


-(void)initView;
-(void)initTotalPrice;
@end
