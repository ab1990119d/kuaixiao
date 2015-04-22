//
//  SelectChanceViewController.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  单选商机  返回值为  chanceId 和 chanceName 

#import "BaseViewController.h"
#import "MJRefresh.h"
#import "Chance.h"
#import "AddCusContactTableViewCell.h"
#import "UIButton+LXHButtonBlock.h"
typedef void (^chanceBolck)(NSDictionary *chanceDic);
@interface SelectChanceViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyNavigationBarDelegate>
{
    UITableView *myTableView;
}
@property (nonatomic , copy)chanceBolck myBlock;
@property int pageNo;
@property (nonatomic , strong) UIButton *selectButton;
@property (nonatomic,strong) NSMutableArray *chanceList;
@property (nonatomic ,strong) NSString *custId;
@property (nonatomic , strong)NSDictionary *chanceDic;

@end
