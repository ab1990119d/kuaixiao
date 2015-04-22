//
//  SelectConatctViewController.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "SelectConatctViewController.h"

@interface SelectConatctViewController ()

@end

@implementation SelectConatctViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    followUserArr = [NSMutableArray array];
    self.navigatinBar.delegate = self;
    [self.view addSubview: self.navigatinBar];
    [self listRequest];
    [self initTableView];
}
- (void)initTableView{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight - NavHeight) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
}
- (void)listRequest{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 3.0f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userDic = [[defaults objectForKey:@"userDic"] copy];
    NSString *userName = [userDic objectForKey:@"userId"];
    NSDictionary *parameters = @{@"userId":userName};
    NSString * urlStr = [NSString stringWithFormat:@"%@/user/list.do",MAINURL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
      
        NSMutableDictionary *d =[NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults]valueForKey:@"userDic"]];
        [d setObject:@"#" forKey:@"pinyin"];
        NSMutableArray *userArr = [[NSMutableArray alloc] init];
        [userArr addObjectsFromArray:responseObject];
        [userArr addObject:d];
        
        self.listArr = [NSMutableArray new];
        self.listArr = userArr;
    
        keyStrArr = [NSMutableArray array]; //该数组放的是游戏首字母关键字
        gameDic = [[NSMutableDictionary alloc] init]; //处理后的字典，关键字是游戏名称首字母，对应该首字母开头的数据集合
        NSString * lastStr = [[NSString alloc] init];
        NSMutableArray * tmpArr = nil;
        for (NSDictionary * dic in self.listArr) {
            NSString * keyStr = [dic valueForKey:@"pinyin"];
            if (keyStr.length>0) {
                keyStr = [keyStr substringWithRange:NSMakeRange(0, 1)]; //取出拼音首字母
                keyStr = [keyStr uppercaseString];  //小写转换成大写
            }
            if (![keyStr isEqualToString:lastStr]) {
                tmpArr = nil;
                tmpArr = [NSMutableArray array];
                [keyStrArr addObject:keyStr];
            }
            [tmpArr addObject:dic];
            [gameDic setObject:tmpArr forKey:keyStr];
            lastStr = keyStr;
        }
        [myTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [KuaiXiaoTool showAlert:@"请求数据失败"];
    }];
    
}

#pragma mark - UITableViewDelegate -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"addCell";
    FollowUserTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = (FollowUserTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FollowUserTableViewCell" owner:nil options:nil]objectAtIndex:0];
        
    }
    NSString * keyStr = [keyStrArr objectAtIndex:indexPath.section];
    NSArray * tmp = [gameDic valueForKey:keyStr];
    NSDictionary * dic = [tmp objectAtIndex:indexPath.row];
    NSString *nameStr = [dic objectForKey:@"userName"];
    NSString *departName = [dic objectForKey:@"departName"];
    NSString *post = [dic objectForKey:@"post"];
    NSString *buMenStr;
    if (post.length > 0) {
        buMenStr = [NSString stringWithFormat:@"%@-%@",departName,post];
    }else{
        buMenStr = departName;
    }
   
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    [btn setImage:[UIImage imageNamed:@"ic_people_unselected_other.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"ic_people_selected_other.png"] forState:UIControlStateSelected];
    [cell.contentView addSubview: btn];
    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
    [parmas setObject:[dic objectForKey:@"userId"] forKey:@"userId"];
    [parmas setObject:[dic objectForKey:@"userName"] forKey:@"userName"];
    [btn setParam:parmas];
    [btn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1234*indexPath.section + indexPath.row + 1000;
    if (_selectButton !=nil) {
        if (_selectButton.tag == btn.tag) {
            btn.selected =YES;
        }
    }
    cell.nameLabel.text = nameStr;
    cell.buMenLabel.text = buMenStr;
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",DOWNLOADURL,[dic objectForKey:@"minPhoto"]];
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"icon_addfriend.png"]];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * keyStr = [keyStrArr objectAtIndex:section];
    NSArray * tmp = [gameDic valueForKey:keyStr];
    return [tmp count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keyStrArr count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * keyStr = [keyStrArr objectAtIndex:section];
    return keyStr;
    
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keyStrArr;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:1234*indexPath.section+indexPath.row + 1000];
    [self selectBtn:btn];
    
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
-(void)selectBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSMutableDictionary *parms= [btn param];
    NSString *str = [parms objectForKey:@"userId"];
    NSString *nameStr = [parms objectForKey:@"userName"];
    
    _customerDic = @{@"userId":str,@"userName":nameStr};
    
    if (btn.selected) {
        _selectButton = nil;
    }else{
        _selectButton = btn;
    }
    
    [myTableView reloadData];
}
#pragma mark - MyNavigationDelegate -
-(void)leftBtnAcion:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnAcion:(id)sender{
    if (self.myBlock) {
        self.myBlock(_customerDic);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
