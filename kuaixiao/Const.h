//
//  Const.h
//  kuaixiao
//
//  Created by 邹克鹏 on 14/11/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#ifndef UU898Game_Const_h
#define UU898Game_Const_h

//APP INFO
#define APP_NAME @"KuaiXiao"
#define VERSION @"v0.1.0"
#define COPYRIGHT @"Copyright @2014 LXH All Rights Reserved"

/// NSError userInfo key that will contain response data
#define JSONResponseSerializerWithDataKey @"JSONResponseSerializerWithDataKey"

//屏幕高度和宽度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
//是否是ios7系统
#define IOS7  [[[UIDevice currentDevice]systemVersion] intValue]<7?NO:YES
#define IOS8  [[[UIDevice currentDevice]systemVersion] intValue]<8?NO:YES
//自定义navigationbar的高度值
#define NavHeight  ([[[UIDevice currentDevice]systemVersion] intValue]<7?44.0:64.0)
////屏幕开始的Y值
//#define ScreenY  [[[UIDevice currentDevice]systemVersion] intValue]<7?44:64
//除去navigationbar和tabbar之外的屏幕高度,ios6减去头44和20的状态栏
#define MiddleHeight [[[UIDevice currentDevice]systemVersion] intValue]<7?([UIScreen mainScreen].bounds.size.height - 64.0):([UIScreen mainScreen].bounds.size.height-44.0)
//rgbColor
#define Color(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define BACKGROUNDCOLOR [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]
#define TITLELABELCOLOR [UIColor colorWithRed:11.0/255.0 green:92.0/255.0 blue:254.0/255.0 alpha:1.0]
#pragma mark - 本地文件存储路径 -
#define DOCUMENT_CACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#pragma mark - 百度地图秘钥-
#define BAIDUMAPKEY @"rQkVpn6HSak9VS3ozd08lHOq"

#pragma mark - 接口数据 - 
//正式服务器接口水电费


//后台 #define MAINURL @"http://10.65.12.32:8888/kx"
//张彬服务器

//下载地址
#define DOWNLOADURL @"http://10.65.12.33:8080/"
#define SERVER_HOST @"10.65.12.32:8080/kx-service/android"
#define MAINURL @"http://10.65.12.32:8080/kx-service/android"

//#define SERVER_HOST @"192.168.1.142:8080/kx-service/android"
//#define MAINURL @"http://192.168.1.142:8080/kx-service/android"
#endif
