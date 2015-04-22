//
//  SelectConatctViewController.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  单选联系人  返回的为userId  userName

#import "BaseViewController.h"
#import "ChineseInclude.h"
#import "FollowUserTableViewCell.h"
#import "UIButton+LXHButtonBlock.h"
#import "UIImageView+WebCache.h"
typedef void (^contactBolck)(NSDictionary *contactDic);
@interface SelectConatctViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyNavigationBarDelegate>
{
    NSMutableDictionary * gameDic; //处理后的字典，关键字是名称首字母，对应该首字母开头的数据集合
    NSMutableArray * keyStrArr; //该数组放的是首字母关键字
    UITableView *myTableView;
    NSMutableArray *followUserArr;
}
@property (nonatomic , copy)contactBolck myBlock;
@property (nonatomic , strong)NSMutableArray *listArr;
@property (nonatomic , strong)NSMutableArray *searchImageArr;
@property (nonatomic , strong)NSDictionary *customerDic;
@property (nonatomic , strong) UIButton *selectButton;


@end
