//
//  UIButton+LXHButtonBlock.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/4.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#define kUIButtonBlockTouchUpInside @"TouchInside"


#import <UIKit/UIKit.h>


@interface UIButton (Block)


@property (nonatomic, strong) NSMutableDictionary *actions;

//@property (nonatomic, strong) NSMutableDictionary *param;

- (void) setAction:(NSString*)action withBlock:(void(^)())block;

- (void)setParam:(NSMutableDictionary *)params;

- (NSMutableDictionary*)param;

@end