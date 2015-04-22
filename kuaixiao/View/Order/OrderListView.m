//
//  OrderListView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "OrderListView.h"

@implementation OrderListView


-(void)initView{
    _dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.frame.size.height) style:UITableViewStylePlain];
    _dataTableView.delegate = self;
    _dataTableView.dataSource = self;
    [AppUtiles setExtraCellLineHidden:_dataTableView];
    [self addSubview:_dataTableView];
    
    if ([_orderDetails count]!= 0) {
        [self initTotalPrice];
    }
   }

-(void)initTotalPrice{
    _totalPrice =0;
    for(OrderDetail *detail in _orderDetails)
    {
        if (detail.totalPrice == 0) {
            if (detail.discountPercent == 0) {
                detail.dis =2;
            }else{
                detail.dis = 1;
            }
            
            if (detail.dis == 1) {
                detail.totalPrice = detail.num *detail.price  * detail.discountPercent*0.01;
            }else{
                detail.totalPrice = detail.num *detail.price  - detail.discountSub;
            }
        }
             _totalPrice = _totalPrice + detail.totalPrice;
    }
    _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    _totalLabel.text =  [[NSString alloc]initWithFormat:@"总金额：%.2f",_totalPrice];
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
    return [_orderDetails count];
}
#pragma mark -每一行的内容为数组相应索引的值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * competeIdentifier = @"OrderListCell";
    OrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:competeIdentifier];
    if (!cell) {
        cell = (OrderListCell *)[[[NSBundle mainBundle] loadNibNamed:@"OrderListCell" owner:nil options:nil]objectAtIndex:0];
    }
    
    OrderDetail *detail = [_orderDetails objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, ScreenWidth, 15)];
    nameLabel.text =  detail.proName;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor blackColor];
    
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, ScreenWidth, 10)];
    numLabel.text = [[NSString alloc]initWithFormat:@"数量：%.0f%@  价格：¥ %.2f",detail.origMeasureNum,detail.origMeasureName,detail.price];
    numLabel.textAlignment = NSTextAlignmentLeft;
    numLabel.font = [UIFont systemFontOfSize:12.0];
    numLabel.textColor = [UIColor lightGrayColor];
    
    UILabel *disLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 35, ScreenWidth, 10)];
    
    if (detail.dis == 1) {
        disLabel.text = [[NSString alloc]initWithFormat:@"折扣：%.0f ％",detail.discountPercent];
    }else{
        disLabel.text = [[NSString alloc]initWithFormat:@"减价：%.0f元",detail.discountSub];
    }
    disLabel.textAlignment = NSTextAlignmentLeft;
    disLabel.font = [UIFont systemFontOfSize:12.0];
    disLabel.textColor = [UIColor lightGrayColor];
    
    UILabel *totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 35, ScreenWidth-40, 10)];
    totalLabel.text = [[NSString alloc]initWithFormat:@"¥ %.2f",detail.totalPrice];
    totalLabel.textAlignment = NSTextAlignmentRight;
    totalLabel.font = [UIFont systemFontOfSize:12.0];
    totalLabel.textColor = [UIColor redColor];
    
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    
    [deleteBtn setImage:[UIImage imageNamed:@"list_delete_bg_normal@2x"] forState:UIControlStateNormal];
    [deleteBtn setImage:[UIImage imageNamed:@"list_delete_bg_press@2x"] forState:UIControlStateHighlighted];
    
    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
    [parmas setObject:detail forKey:@"detail"];
    [deleteBtn setParam:parmas];
    [deleteBtn addTarget:self action:@selector(deleteDetail:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:nameLabel];
    [cell addSubview:numLabel];
    [cell addSubview:disLabel];
    [cell addSubview:totalLabel];
    [cell addSubview:deleteBtn];
    
    return cell;
}

-(void)deleteDetail:(UIButton *)sender{
    NSMutableDictionary *parms= [(UIButton *) sender param];
    OrderDetail  *detail = [parms objectForKey:@"detail"];
    [_orderDetails removeObject:detail];
    [self initTotalPrice];
    [_dataTableView reloadData];

}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetail *detail = [_orderDetails objectAtIndex:indexPath.row];
    if ([self.delegate respondsToSelector:@selector(selectOrder:)]) {
        [self.delegate selectOrder:detail];
    }
}
@end
