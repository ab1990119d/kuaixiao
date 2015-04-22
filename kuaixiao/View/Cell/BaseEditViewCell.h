//
//  BaseEditViewCell.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  定义不同的cell 样式 供产品中各种需要的地方使用

#import <UIKit/UIKit.h>

@interface BaseEditViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelValue;

@end
