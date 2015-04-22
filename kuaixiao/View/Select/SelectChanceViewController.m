//
//  SelectChanceViewController.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "SelectChanceViewController.h"

@interface SelectChanceViewController ()

@end

@implementation SelectChanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _chanceList = [NSMutableArray new];
    _pageNo = 1;
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [_chanceList removeAllObjects];
    [self loadData];
}

-(void)initView{
    MyNavigationBar *navigation = [[MyNavigationBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, NavHeight) withTitle:@"我的商机" withLeftTitle:@"销售管理" withRightTitle:@"保存" withLeftBtnHidden:NO withRightBtnHidden:NO];
    navigation.delegate = self;
    [self.view addSubview:navigation];
    [self initChanceListView];
}

-(void)initChanceListView{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight)];
    myTableView.delegate  = self;
    myTableView.dataSource = self;
    [AppUtiles setExtraCellLineHidden:myTableView];
    [myTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    [myTableView addHeaderWithTarget:self action:@selector(hearderRereshing)];
    [self.view addSubview:myTableView];
}

-(void)loadData{
    
    NSString *userId = [UserDefaultsUtils valueWithKey:@"userId"];
    NSDictionary *parameters =  @{@"userId":userId,@"custId":_custId,@"pageNo":[AppUtiles stringFromDouble:_pageNo]};
    NSString * urlStr = @"/chance/custChanceList.do";
    
    CommonHandler *handler = [[CommonHandler alloc]init];
    SuccessBlock success = ^(id obj){
        if ([obj count] != 0) {
            NSArray *list = [Chance objectArrayWithKeyValuesArray:[obj objectForKey:@"records"]];
            [_chanceList addObjectsFromArray:list];
        }
        [myTableView reloadData];
        [AppUtiles dismissHUD];
    };
    
    FailedBlock failed = ^(id obj){
        [AppUtiles showNetErrorMessage];
    };
    
    [handler requestData:parameters requestUrl:urlStr success:success failed:failed];
}

#pragma mark -下拉加载
- (void)footerRereshing{
    _pageNo ++ ;
    [self loadData];
    [myTableView footerEndRefreshing];
}
#pragma mark-  上拉刷新
- (void)hearderRereshing{
    _pageNo = 1;
    [_chanceList removeAllObjects];
    [self loadData];
    [myTableView headerEndRefreshing];
}

-(void)selectBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSMutableDictionary *parms= [btn param];
    NSString *str = [parms objectForKey:@"chanceId"];
    NSString *nameStr = [parms objectForKey:@"chanceName"];
    
    _chanceDic = @{@"chanceId":str,@"chanceName":nameStr};
    
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
        self.myBlock(_chanceDic);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UITableViewDelegate -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_chanceList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"addCell";
    AddCusContactTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = (AddCusContactTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"AddCusContactTableViewCell" owner:nil options:nil]objectAtIndex:0];
        
    }
     if ([_chanceList count] !=0) {
    Chance *chance = [_chanceList objectAtIndex:indexPath.row];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    [btn setImage:[UIImage imageNamed:@"ic_people_unselected_other.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"ic_people_selected_other.png"] forState:UIControlStateSelected];
    [cell.contentView addSubview: btn];
  
    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
    [parmas setObject:chance.chanceId forKey:@"chanceId"];
    [parmas setObject:chance.chanceName forKey:@"chanceName"];
    [btn setParam:parmas];
    [btn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
  
    btn.tag = 1234*indexPath.section + indexPath.row + 1000;
    if (_selectButton !=nil) {
        if (_selectButton.tag == btn.tag) {
            btn.selected =YES;
        }
    }
    [cell.contentView addSubview: btn];
    cell.nameLabel.text = chance.chanceName;
    cell.cusNameLabel.text = chance.stageDisplay;
     }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIButton *btn = (UIButton *)[self.view viewWithTag:1234*indexPath.section+indexPath.row + 1000];
    [self selectBtn:btn];
}


@end
