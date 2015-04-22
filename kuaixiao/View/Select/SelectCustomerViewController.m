//
//  SelectCustomerViewController.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "SelectCustomerViewController.h"

@interface SelectCustomerViewController ()

@end

@implementation SelectCustomerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    searchResultArr = [NSMutableArray array];
    self.imageDic= [NSMutableDictionary dictionary];
    self.navigatinBar.delegate = self;
    [self.view addSubview: self.navigatinBar];
    [self initSearchViewAndTableView];
    [self listRequest];
}

- (void)initSearchViewAndTableView{
    searchResultBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, NavHeight + 1, ScreenWidth, 50)];
    searchResultBar.delegate = self;
    searchResultBar.placeholder = @"按姓名或者姓名首拼搜索";
    [self.view addSubview:searchResultBar];
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, searchResultBar.frame.size.height + searchResultBar.frame.origin.y, ScreenWidth, ScreenHeight - searchResultBar.frame.size.height-searchResultBar.frame.origin.y) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self setExtraCellLineHidden:myTableView];
    [self.view addSubview:myTableView];
}
#pragma mark - 请求数据我的客户
- (void)listRequest{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 3.0f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userDic = [defaults objectForKey:@"userDic"];
    NSString *userName = [userDic objectForKey:@"userId"];
    NSDictionary *parameters = @{@"userId":userName};
    NSString * urlStr = [NSString stringWithFormat:@"%@/customer/list.do",MAINURL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.listArr = responseObject;
        keyStrArr = [NSMutableArray array]; //该数组放的是游戏首字母关键字
        gameDic = [[NSMutableDictionary alloc] init]; //处理后的字典，关键字是游戏名称首字母，对应该首字母开头的数据集合
        NSString * lastStr = [[NSString alloc] init];
        NSMutableArray * tmpArr = nil;
        NSMutableArray *imageArr = nil;
        for (NSDictionary * dic in self.listArr) {
            NSString * keyStr = [dic valueForKey:@"pinyin"];
            NSString * str = @"NO";
            if (keyStr.length>0) {
                keyStr = [keyStr substringWithRange:NSMakeRange(0, 1)]; //取出拼音首字母
                keyStr = [keyStr uppercaseString];  //小写转换成大写
            }
            if (![keyStr isEqualToString:lastStr]) {
                tmpArr = nil;
                imageArr = nil;
                tmpArr = [NSMutableArray array];
                imageArr = [NSMutableArray array];
                [keyStrArr addObject:keyStr];
            }
            [tmpArr addObject:dic];
            [imageArr addObject:str];
            [self.imageDic setObject:imageArr forKey:keyStr];
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
    AddChanceByCustomerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = (AddChanceByCustomerTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"AddChanceByCustomerTableViewCell" owner:nil options:nil]objectAtIndex:0];
        
    }
    NSString *str;
    if ([searchResultBar.text length]!=0)
    {
        NSDictionary * dic = [searchResultArr objectAtIndex:indexPath.row];
        str = [self.searchImageArr objectAtIndex:indexPath.row];
        if ([str isEqualToString:@"YES"]) {
            cell.cilckImage.image = [UIImage imageNamed:@"ic_people_selected_other.png"];
        }else{
            cell.cilckImage.image = [UIImage imageNamed:@"ic_people_unselected_other.png"];
        }
        NSString *nameStr = [dic objectForKey:@"custName"];
        NSString *addressStr = [dic objectForKey:@"custAddr"];
        cell.customerName.text = nameStr;
        cell.addressName.text = addressStr;
    }else{
        NSString * keyStr = [keyStrArr objectAtIndex:indexPath.section];
        NSArray * tmp = [gameDic valueForKey:keyStr];
        NSDictionary * dic = [tmp objectAtIndex:indexPath.row];
        NSArray *imageArr = [self.imageDic valueForKey:keyStr];
        NSString *str  = [imageArr objectAtIndex:indexPath.row];
        NSString *nameStr = [dic objectForKey:@"custName"];
        NSString *addressStr = [dic objectForKey:@"custAddr"];
        cell.customerName.text = nameStr;
        cell.addressName.text = addressStr;
        if ([str isEqualToString:@"YES"]) {
            cell.cilckImage.image = [UIImage imageNamed:@"ic_people_selected_other.png"];
        }else{
            cell.cilckImage.image = [UIImage imageNamed:@"ic_people_unselected_other.png"];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    [searchResultBar resignFirstResponder];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([searchResultBar.text length]!=0) {
        return [searchResultArr count];
    }
    NSString * keyStr = [keyStrArr objectAtIndex:section];
    NSArray * tmp = [gameDic valueForKey:keyStr];
    return [tmp count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([searchResultBar.text length]!=0) {
        return 1;
    }
    return [keyStrArr count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([searchResultBar.text length]!=0) {
        return nil;
    }
    NSString * keyStr = [keyStrArr objectAtIndex:section];
    return keyStr;
    
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if ([searchResultBar.text length]!=0) {
        return nil;
    }
    return keyStrArr;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic;
    if ([searchResultArr count]!=0) {
        dic = [searchResultArr objectAtIndex:indexPath.row];
        if (self.searchImageArr) {
            self.searchImageArr = nil;
        }
        self.searchImageArr = [NSMutableArray array];
        for (int i = 0; i < searchResultArr.count; i ++) {
            NSString *str;
            if (i == indexPath.row) {
                str = @"YES";
            }else{
                str = @"NO";
            }
            [self.searchImageArr addObject:str];
        }
    }else{
        if (self.imageDic) {
            self.imageDic = nil;
        }
        NSMutableArray *imageArr;
        NSString *str1;
        self.imageDic = [NSMutableDictionary dictionary];
        for (int i = 0; i < keyStrArr.count; i ++) {
            NSString *str = [keyStrArr objectAtIndex:i];
            NSArray *arr = [gameDic objectForKey:str];
            if (imageArr) {
                imageArr = nil;
            }
            imageArr = [NSMutableArray array];
            for (int j = 0; j < arr.count; j++) {
                if (i == indexPath.section&&j==indexPath.row) {
                    str1 = @"YES";
                }else{
                    str1 = @"NO";
                }
                [imageArr addObject:str1];
            }
            [self.imageDic setObject:imageArr forKey:str];
        }
        NSString * keyStr = [keyStrArr objectAtIndex:indexPath.section];
        NSArray * tmp = [gameDic valueForKey:keyStr];
        dic = [tmp objectAtIndex:indexPath.row];
    }
    self.customerDic = dic;
    [myTableView reloadData];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
#pragma mark - UISearchBarDelegate -
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchResultArr) {
        searchResultArr = nil;
    }
    searchResultArr = [[NSMutableArray alloc]init];
    if ([searchText length]>0&&![ChineseInclude isIncludeChineseInString:searchText]) {
        for (NSDictionary * dic  in self.listArr) {
            NSString * pinyin = [dic objectForKey:@"pinyin"];
            NSString * xiaoXie = [pinyin lowercaseString];
            searchText = [searchText lowercaseString];
            BOOL isContent = [xiaoXie hasPrefix:searchText];
            if (isContent) {
                [searchResultArr addObject:dic];
            }
        }
    }
    else if (searchText.length>0&&[ChineseInclude isIncludeChineseInString:searchText]) {
        for (NSDictionary * dic  in self.listArr) {
            NSString * name = [dic objectForKey:@"name"];
            BOOL isContent = [name hasPrefix:searchText];
            if (isContent) {
                [searchResultArr addObject:dic];
            }
        }
    }
    if (self.searchImageArr) {
        self.searchImageArr = nil;
    }
    self.searchImageArr = [NSMutableArray array];
    for (int i = 0; i < searchResultArr.count; i ++) {
        NSString *str = @"NO";
        [self.searchImageArr addObject:str];
    }
    [myTableView reloadData];
}

#pragma mark - MyNavigationDelegate -
-(void)leftBtnAcion:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnAcion:(id)sender{
    if (self.myBlock) {
        self.myBlock(self.customerDic);//括号里面写传的值，直接写值就可以了。
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchResultBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
