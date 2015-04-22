//
//  SelectCustomerViewController.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  单选客户   返回值为 custName 和 custId 

#import "BaseViewController.h"
#import "AddChanceByCustomerTableViewCell.h"
#import "ChineseInclude.h"
typedef void (^chanceByCustomerBolck)(NSDictionary *customerDic);
@interface SelectCustomerViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableDictionary * gameDic; //处理后的字典，关键字是名称首字母，对应该首字母开头的数据集合
    NSMutableArray * keyStrArr; //该数组放的是首字母关键字
    UISearchBar * searchResultBar;//搜索游戏搜索框
    NSMutableArray * searchResultArr;
    UITableView *myTableView;
}
@property (nonatomic , copy)chanceByCustomerBolck myBlock;
@property (nonatomic , strong)NSArray *listArr;
@property (nonatomic , strong)NSMutableDictionary *imageDic;
@property (nonatomic , strong)NSMutableArray *searchImageArr;
@property (nonatomic , strong)NSDictionary *customerDic;

@end
