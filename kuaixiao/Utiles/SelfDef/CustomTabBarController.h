//
//  CustomTabBarController.h
//  kuaixiao
//
//  Created by 邹克鹏 on 14/11/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarController : UITabBarController {
    NSMutableArray *buttons;
    NSInteger currentSelectedIndex;
    UIImageView *slideBg;  //选中的滑块
    UIView * backView;
    UIButton * tmpBtn;
}

@property (nonatomic,assign) NSInteger currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;

- (void)hideRealTabBar;
- (void)customTabBar;
- (void)selectedTab:(UIButton *)button;
//隐藏tabbar
- (void)tabBarHidden:(BOOL)hide WithMoveLeft:(BOOL)animation;
- (void)tabBarHidden:(BOOL)hide WithAnimation:(BOOL)animation;
- (void)tabBarHidden:(BOOL)hide;
@end
