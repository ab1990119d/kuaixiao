//
//  FormFieldItem.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/12.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormFieldItem : NSObject

/**
 * 选项Id
 */
@property long itemId;

/**
 * 选项名称
 */
@property (nonatomic , strong)NSString *itemLabel;

/**
 * 字段Id
 */
@property long fieldId;

/**
 * 表单Id
 */
@property long formDefId;

@end
