//
//  InputViewController.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef void (^importBlock)(NSString *textStr);

@interface InputViewController : BaseViewController

@property int type;
@property (nonatomic , copy)importBlock myBlock;
@property (nonatomic , strong)NSString *textStr;
@property (nonatomic , strong)UITextField *importTextField;
@property (nonatomic , strong)UITextView *importTextView;

@end
