//
//  ProductListView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/23.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "ProductListView.h"

@implementation ProductListView


-(void)initViewWithProduct:(OrderDetail *)dic {

    NSString *titleStr = dic.proName;
    
    NSString *textStr = [[NSString alloc]initWithFormat:@"规格：%@/%@                 参考价格：%.2f元",dic.specification,dic.model,dic.price];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, ScreenWidth, 20)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = titleStr;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:14.0];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, ScreenWidth, 20)];
    textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.text = textStr;
    textLabel.textColor = [UIColor lightGrayColor];
    textLabel.font = [UIFont systemFontOfSize:12.0];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, ScreenWidth, 60);
    _btn.backgroundColor = [UIColor clearColor];
    [_btn addSubview:nameLabel];
    [_btn addSubview:textLabel];
    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
    [parmas setObject:dic forKey:@"product"];
    [_btn setParam:parmas];
    [self addSubview:_btn];
}


-(void)initViewWithPromoteProduct:(PromoteProduct *)dic {
    
    NSString *titleStr = dic.proName;
    
    NSString *textStr = [[NSString alloc]initWithFormat:@"规格：%@/%@                 参考价格：%.2f元",dic.specification,dic.model,dic.price];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, ScreenWidth, 20)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = titleStr;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:14.0];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, ScreenWidth, 20)];
    textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.text = textStr;
    textLabel.textColor = [UIColor lightGrayColor];
    textLabel.font = [UIFont systemFontOfSize:12.0];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, ScreenWidth, 60);
    _btn.backgroundColor = [UIColor clearColor];
    [_btn addSubview:nameLabel];
    [_btn addSubview:textLabel];
    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
    [parmas setObject:dic forKey:@"product"];
    [_btn setParam:parmas];
    [self addSubview:_btn];
}

@end
