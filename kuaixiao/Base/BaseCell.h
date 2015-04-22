//
//  BaseCell.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

@interface BaseCell : BaseModel

@property (nonatomic ,strong) NSString *labelName;

@property (nonatomic ,strong) NSString *labelValue;

@property (nonatomic ) BOOL required;

@property (nonatomic) NSInteger *type;

@end
