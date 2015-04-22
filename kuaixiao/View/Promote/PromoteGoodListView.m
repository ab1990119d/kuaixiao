//
//  PromoteGoodListView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/6.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "PromoteGoodListView.h"

@implementation PromoteGoodListView


-(void)initView{
    _dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.frame.size.height) style:UITableViewStylePlain];
    _dataTableView.delegate = self;
    _dataTableView.dataSource = self;
    
    [AppUtiles setExtraCellLineHidden:_dataTableView];
    [self addSubview:_dataTableView];
    
    if ([_goodlits count]!= 0) {
        [self initTotalPrice];
    }
}

-(void)initTotalPrice{
    _totalPrice =0;
    for(PromoteGood *detail in _goodlits)
    {
        _totalPrice = _totalPrice + detail.price;
    }
    _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    _totalLabel.text =  [[NSString alloc]initWithFormat:@"花费总金额：%.2f",_totalPrice];
    _totalLabel.textAlignment = NSTextAlignmentRight;
    _totalLabel.textColor = [UIColor redColor];
    _dataTableView.tableFooterView = _totalLabel;
}


#pragma mark - row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

#pragma mark -设置表格的行数为数组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_goodlits count];
}
#pragma mark -每一行的内容为数组相应索引的值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * competeIdentifier = @"OrderListCell";
    OrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:competeIdentifier];
    if (!cell) {
        cell = (OrderListCell *)[[[NSBundle mainBundle] loadNibNamed:@"OrderListCell" owner:nil options:nil]objectAtIndex:0];
    }
    
    PromoteGood *detail = [_goodlits objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, ScreenWidth, 15)];
    nameLabel.text =  detail.goodName;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor blackColor];
    
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, ScreenWidth, 10)];
    numLabel.text = [[NSString alloc]initWithFormat:@"数量：%@  花费金额：¥ %.2f",detail.num,detail.price];
    numLabel.textAlignment = NSTextAlignmentLeft;
    numLabel.font = [UIFont systemFontOfSize:12.0];
    numLabel.textColor = [UIColor lightGrayColor];
    
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    
    [deleteBtn setImage:[UIImage imageNamed:@"list_delete_bg_normal@2x"] forState:UIControlStateNormal];
    [deleteBtn setImage:[UIImage imageNamed:@"list_delete_bg_press@2x"] forState:UIControlStateHighlighted];
    
    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
    [parmas setObject:detail forKey:@"detail"];
    [deleteBtn setParam:parmas];
    [deleteBtn addTarget:self action:@selector(deleteDetail:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:nameLabel];
    [cell addSubview:numLabel];
    [cell addSubview:deleteBtn];
    
    return cell;
}

-(void)deleteDetail:(UIButton *)sender{
    NSMutableDictionary *parms= [(UIButton *) sender param];
    PromoteGood  *detail = [parms objectForKey:@"detail"];
    [_goodlits removeObject:detail];
    [self initTotalPrice];
    [_dataTableView reloadData];
    if ([self.delegate respondsToSelector:@selector(deleteGood)]) {
        [self.delegate deleteGood];
    }
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PromoteGood *detail = [_goodlits objectAtIndex:indexPath.row];
    if ([self.delegate respondsToSelector:@selector(selectGood:)]) {
        [self.delegate selectGood:detail];
    }
}


@end
