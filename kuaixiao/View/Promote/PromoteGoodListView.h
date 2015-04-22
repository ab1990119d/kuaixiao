//
//  PromoteGoodListView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromoteGood.h"
#import "OrderListCell.h"
#import "UIButton+LXHButtonBlock.h"
@protocol PromoteGoodListViewDelegate <NSObject>

@optional

-(void)selectGood:(PromoteGood *) good;
-(void)deleteGood;

@end

@interface PromoteGoodListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) id <PromoteGoodListViewDelegate> delegate;

@property (nonatomic , strong) UITableView *dataTableView;

@property (nonatomic , strong) NSMutableArray *goodlits;

@property (nonatomic , strong) UILabel *totalLabel;

@property (nonatomic ) double totalPrice;

-(void)initView;
-(void)initTotalPrice;
@end
