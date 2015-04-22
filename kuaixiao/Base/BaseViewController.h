//
//  BaseViewController.h
//  zlydoc-iphone
//
//  Created by Ryan on 14-5-23.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIActionSheetDelegate,MyNavigationBarDelegate>

/** 导航条  **/
@property (nonatomic ,strong) MyNavigationBar *navigatinBar;
@end