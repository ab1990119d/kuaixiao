//
//  AppDelegate.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/11.
//  Copyright (c) 2014年 LXH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic , strong)BMKMapManager *mapManager;

@end

