//
//  FormField.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/12.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "FormField.h"
#import "FormFieldItem.h"

@implementation FormField

- (NSDictionary *)objectClassInArray
{
    return @{@"formFieldItemList" : [FormFieldItem class]};
}

@end
