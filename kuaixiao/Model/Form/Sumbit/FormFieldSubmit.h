//
//  FormFieldSubmit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/17.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormField.h"

@interface FormFieldSubmit : NSObject

@property (nonatomic , strong)NSString *fieldId; // 字段ID
@property (nonatomic , strong)NSString *inputType; // 控件类型:-1分割线, 1单行文本框, 2多行文本框, 3单选框, 5下拉, 6附近(图片)
/**
 * 字段填报值
 */
@property (nonatomic , strong)NSString *fieldVal;

+ (NSArray *) initWithFormField:(NSArray *) formField;
@end
