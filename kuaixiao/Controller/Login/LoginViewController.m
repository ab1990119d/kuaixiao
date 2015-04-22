//
//  LoginViewController.m
//  kuaixiao
//
//  Created by 邹克鹏 on 14/11/21.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic , strong)UIImageView *iconImageView;
@property (nonatomic , strong)UITextField *businessText;
@property (nonatomic , strong)UITextField *telephone;
@property (nonatomic , strong)UITextField *password;
@property (nonatomic , strong)UIImageView *businessLineImage;
@property (nonatomic , strong)UIImageView *telephoneLineImage;
@property (nonatomic , strong)UIImageView *passwordLineImage;
@property (nonatomic , strong)UIView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMainView];
    [self initBtnClick];
    // Do any additional setup after loading the view.
}
- (void)initMainView{
    self.loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.loginView];
    
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth - 70)/2, 40, 60, 60)];
    self.iconImageView.image = [UIImage imageNamed:@"loginIcon.png"];
    self.iconImageView.backgroundColor = [UIColor clearColor];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.height/2;
    [self.loginView addSubview:self.iconImageView];
    
    UILabel *businessLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 70, 30)];
    businessLabel.text = @"企业账号  :";
    businessLabel.textColor = [UIColor blackColor];
    businessLabel.font = [UIFont systemFontOfSize:14.0];
    [self.loginView addSubview:businessLabel];
    
    UILabel *telephoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 170, 70, 30)];
    telephoneLabel.text = @"手机号码  :";
    telephoneLabel.font = [UIFont systemFontOfSize:14.0];
    [self.loginView addSubview:telephoneLabel];
    
    UILabel *passwordLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, 70, 30)];
    passwordLable.text = @"密       码  :";
    passwordLable.font = [UIFont systemFontOfSize:14.0];
    [self.loginView addSubview:passwordLable];
    
    
    NSArray *imageArr = [NSArray arrayWithObjects:@"business.png",@"username.png",@"password.png", nil];
    for (int i = 0 ; i < imageArr.count; i ++ ) {
        UIImageView *businessImage = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - 45, 120 + 50 *i, 20, 20)];
        businessImage.backgroundColor = [UIColor whiteColor];
        UIImage *image = [UIImage imageNamed:[imageArr objectAtIndex:i]];
        businessImage.image = image;
        [self.loginView addSubview:businessImage];
    }
    
    self.businessLineImage = [[UIImageView alloc]initWithFrame:CGRectMake(90, 135, ScreenWidth - 110, 8)];
    self.businessLineImage.image = [UIImage imageNamed:@"line-normal.png"];
    self.businessLineImage.backgroundColor = [UIColor clearColor];
    [self.loginView addSubview:self.businessLineImage];
    
    self.telephoneLineImage = [[UIImageView alloc]initWithFrame:CGRectMake(90, 185, ScreenWidth - 110, 8)];
    self.telephoneLineImage.image = [UIImage imageNamed:@"line-normal.png"];
    self.telephoneLineImage.backgroundColor = [UIColor clearColor];
    [self.loginView addSubview:self.telephoneLineImage];
    
    self.passwordLineImage = [[UIImageView alloc]initWithFrame:CGRectMake(90, 235, ScreenWidth - 110, 8)];
    self.passwordLineImage.image = [UIImage imageNamed:@"line-normal.png"];
    self.passwordLineImage.backgroundColor = [UIColor clearColor];
    [self.loginView addSubview:self.passwordLineImage];
    
    self.businessText = [[UITextField alloc]initWithFrame:CGRectMake(100, 120, ScreenWidth - 65, 30)];
    self.businessText.font = [UIFont systemFontOfSize:14.0];
    self.businessText.placeholder = @"企业账号";
    self.businessText.tag = 1001;
    self.businessText.delegate = self;
    [self.loginView addSubview:self.businessText];
    
    self.telephone = [[UITextField alloc]initWithFrame:CGRectMake(100, 170, ScreenWidth - 65, 30)];
    self.telephone.font = [UIFont systemFontOfSize:14.0];
    self.telephone.placeholder = @"手机号码";
    self.telephone.tag = 1002;
    self.telephone.delegate = self;
    [self.loginView addSubview:self.telephone];
    
    self.password = [[UITextField alloc]initWithFrame:CGRectMake(100, 220, ScreenWidth - 65, 30)];
    self.password.font = [UIFont systemFontOfSize:14.0];
    self.password.placeholder = @"密码";
    self.password.tag = 1003;
    self.password.delegate = self;
    [self.loginView addSubview:self.password];
    
}

- (void)initBtnClick{
    UIButton *testLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    testLogin.frame = CGRectMake(10, 280, (ScreenWidth - 40)/2, 40);
    [testLogin setTitle:@"快速体验" forState:UIControlStateNormal];
    testLogin.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [testLogin setBackgroundImage:[UIImage imageNamed:@"btn_test_normal.png"] forState:UIControlStateNormal];
    [testLogin setBackgroundImage:[UIImage imageNamed:@"btn_test_pressed.png"] forState:UIControlStateHighlighted];
    [testLogin addTarget:self action:@selector(testLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView addSubview:testLogin];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30 + (ScreenWidth - 40)/2, 280, (ScreenWidth - 40)/2, 40);
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_login_normal.png"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_login_pressed.png"] forState:UIControlStateHighlighted];
    [self.loginView addSubview:loginBtn];
    
    UIButton *changPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changPasswordBtn.frame = CGRectMake((ScreenWidth - 220)/2, 350, 100, 30);
    [changPasswordBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [changPasswordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    changPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [changPasswordBtn addTarget:self action:@selector(changePassWordClick) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView addSubview:changPasswordBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake((ScreenWidth - 100)/2 + 60, 350, 100, 30);
    [registerBtn setTitle:@"免费注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView addSubview:registerBtn];
}
#pragma mark - 快速体验  登陆  找回密码 注册
- (void)testLogin{
    [KuaiXiaoTool showAlert:@"快速体验"];
}
- (void)loginClick{
    self.businessText.text = @"ksource";//18638226037  13783433252
   // self.telephone.text = @"13783433252";
      self.telephone.text = @"18638226037";
    self.password.text = @"123456";
    if (self.businessText.text.length == 0) {
        [KuaiXiaoTool showAlert:@"企业账户不能为空"];
        return;
    }
    if (self.telephone.text.length == 0) {
        [KuaiXiaoTool showAlert:@"手机号码不能为空"];
        return;
    }
    if (self.password.text.length == 0) {
        [KuaiXiaoTool showAlert:@"密码不能为空"];
        return;
    }
    [self loginRequest];
//    CustomTabBarController * tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabController"];
//    tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:tabBarController animated:NO completion:nil];
    
}
- (void)changePassWordClick{
    [KuaiXiaoTool showAlert:@"忘记密码"];
}
- (void)registerClick{
    [KuaiXiaoTool showAlert:@"注册"];
}


#pragma mark - textfileddelegate - - 光标移到指定位置 下面的边框变颜色
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 1001:{
            self.businessLineImage.image = [UIImage imageNamed:@"line-press.png"];
        }
            break;
        case 1002:{
            self.telephoneLineImage.image = [UIImage imageNamed:@"line-press.png"];
            self.telephone.keyboardType = UIKeyboardTypeNumberPad;
        }
            break;
        case 1003:{
            if (IOS8 && ScreenHeight < 500) {
                [UIView animateWithDuration:0.5f animations:^{
                    self.loginView.frame = CGRectMake(0, -20, ScreenWidth, ScreenWidth);
                }];
            }
            self.passwordLineImage.image = [UIImage imageNamed:@"line-press.png"];
        }
            break;
        default:
            break;
    }
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 1001:{
            self.businessLineImage.image = [UIImage imageNamed:@"line-normal.png"];
        }
            break;
        case 1002:{
            self.telephoneLineImage.image = [UIImage imageNamed:@"line-normal.png"];
        }
            break;
        case 1003:{
            self.passwordLineImage.image = [UIImage imageNamed:@"line-normal.png"];
            if (IOS8 && ScreenHeight < 500) {
                [UIView animateWithDuration:0.5f animations:^{
                    self.loginView.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth);
                }];
            }
        }
            break;
        default:
            break;
    }

}
- (void)loginRequest{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 3.0f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * uuidStr = [defaults objectForKey:@"UUIDSTRING"];
    NSDictionary *parameters = @{@"compCode":self.businessText.text,@"phone":self.telephone.text,@"userPwd":self.password.text,@"channel":@"iphone",@"deviceId":uuidStr};
    NSString * urlStr = [NSString stringWithFormat:@"%@/user/login.do",MAINURL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            int code = [[responseObject objectForKey:@"code"] intValue];
            if (code==1) {
                //登陆成功
                NSDictionary *userDic = [responseObject objectForKey:@"user"];
                [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:@"userDic"];
                NSString *userId = [[NSString alloc]initWithFormat:@"%@", [userDic valueForKey:@"userId"]] ;
                [UserDefaultsUtils saveValue:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                CustomTabBarController * tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabController"];
                tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                [self presentViewController:tabBarController animated:NO completion:nil];
                
            }else if(code == 0){
                NSString *error = [responseObject objectForKey:@"error"];
                if ([error isEqualToString:@"1"]) {
                    [KuaiXiaoTool showAlert:@"企业账号错误"];
                }else if ([error isEqualToString:@"2"]){
                    [KuaiXiaoTool showAlert:@"手机号码或密码错误"];
                }else if ([error isEqualToString:@"3"]){
                    [KuaiXiaoTool showAlert:@"授权过期"];
                }
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [KuaiXiaoTool showAlert:@"登陆失败"];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - touchBegan - - 点击非textfiled的地方收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.businessText resignFirstResponder];
    [self.telephone resignFirstResponder];
    [self.password resignFirstResponder];
//        UITouch * touch = [[event allTouches] anyObject];
//        if ([touch.view isEqual:self.mainView]||[touch.view isEqual:self.mainScrollerView]) {
//            
//        }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
