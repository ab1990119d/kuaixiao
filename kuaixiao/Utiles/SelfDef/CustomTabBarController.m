//
//  CustomTabBarController.m
//  kuaixiao
//
//  Created by 邹克鹏 on 14/11/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "CustomTabBarController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

@synthesize currentSelectedIndex;
@synthesize buttons;

- (void)tabBarHidden:(BOOL)hide WithAnimation:(BOOL)animation
{
    if (animation) {
        [UIView animateWithDuration:0.5f animations:^(){
            if (hide) {
                backView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 50);
            }else{
                [self hideRealTabBar];
                backView.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
            }
        }completion:^(BOOL finished){}];
        
    }else{
        if (hide) {
            backView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 50);
        }else{
            [self hideRealTabBar];
            backView.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
        }
    }
}

- (void)tabBarHidden:(BOOL)hide WithMoveLeft:(BOOL)animation{
    if (animation) {
        [UIView animateWithDuration:0.35f animations:^(){
            if (hide) {
                backView.frame = CGRectMake(-ScreenWidth, ScreenHeight-50, ScreenWidth, 50);
            }else{
                [self hideRealTabBar];
                backView.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
            }
        }completion:^(BOOL finished){
//            if (hide) {
//                backView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 50);
//            }
            
        }];
        
    }else{
        if (hide) {
            backView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 50);
        }else{
            [self hideRealTabBar];
            backView.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
        }
    }

}
- (void)tabBarHidden:(BOOL)hide
{
    if (hide) {
        backView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 50);
    }else{
        [self hideRealTabBar];
        backView.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
//    slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomfocus.png"]];
    self.currentSelectedIndex = 10000;
    [self customTabBar];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

//-(void) viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self.selectedViewController endAppearanceTransition];
//}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

//-(void) viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    [self.selectedViewController endAppearanceTransition];
//}

- (void)hideRealTabBar{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.frame = CGRectMake(0, ScreenHeight+50, ScreenWidth, 50);
            view.hidden = YES;
            break;
        }
    }
}

- (void)customTabBar{
    [self hideRealTabBar];
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 50, ScreenWidth, 50)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    UIImage * image1 = [UIImage imageNamed:@"navi_home.png"];
    UIImage * image2 = [UIImage imageNamed:@"btn_通讯录-_normal.png"];
    UIImage * image3 = [UIImage imageNamed:@"btn_企业微信_normal.png"];
    UIImage * image4 = [UIImage imageNamed:@"btn_设置_normal.png"];
    UIImage * imageSel1 = [UIImage imageNamed:@"navi_home_active.png"];
    UIImage * imageSel2 = [UIImage imageNamed:@"btn_通讯录-_pressed.png"];
    UIImage * imageSel3 = [UIImage imageNamed:@"btn_企业微信_pressed.png"];
    UIImage * imageSel4 = [UIImage imageNamed:@"btn_设置_pressed.png"];
    NSArray * imgArr = [[NSArray alloc] initWithObjects:image1,image2,image3,image4,nil];
    NSArray * imgArrSel = [[NSArray alloc] initWithObjects:imageSel1,imageSel2,imageSel3,imageSel4,nil];
    NSUInteger viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
    self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
    double _width = ScreenWidth / viewCount;
    double _height = self.tabBar.frame.size.height;
    for (int i = 0; i < viewCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*_width,0, _width, _height);
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        UIImage * img = [imgArr objectAtIndex:i];
        UIImage * imgS = [imgArrSel objectAtIndex:i];
        btn.tag = 10000+i;
        btn.showsTouchWhenHighlighted = YES;
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [btn setBackgroundImage:imgS forState:UIControlStateHighlighted];
        [btn setBackgroundImage:imgS forState:UIControlStateSelected];
        [backView addSubview:btn];
        [self.buttons addObject:btn];
    }

    [self selectedTab:[self.buttons objectAtIndex:0]];
}

- (void)selectedTab:(UIButton *)button{
    if (self.currentSelectedIndex == button.tag) {
        button.selected = YES;
        return;
    }
    UIButton * btn = (UIButton *)[self.view viewWithTag:currentSelectedIndex];
    [btn setSelected:NO];
    
    button.selected = YES;
    self.currentSelectedIndex = button.tag;
    self.selectedIndex = self.currentSelectedIndex-10000;
}

- (void)slideTabBg:(UIButton *)btn{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.20];
    [UIView setAnimationDelegate:self];
    slideBg.frame = CGRectMake(btn.frame.origin.x - 30, btn.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
    [UIView commitAnimations];
}

@end
