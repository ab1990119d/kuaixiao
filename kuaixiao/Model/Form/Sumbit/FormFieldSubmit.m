//
//  FormFieldSubmit.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/17.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "FormFieldSubmit.h"

@implementation FormFieldSubmit

+ (NSArray *) initWithFormField:(NSArray *) formFields{
    NSMutableArray *sumbits = [NSMutableArray new];
    for(int i=0;i<formFields.count;i++){
          FormField  *formField = [formFields objectAtIndex:i];
        if (formField.fieldVal != nil && formField.fieldVal.length !=0) {
            FormFieldSubmit *sumbit = [FormFieldSubmit alloc];
            sumbit.fieldId = formField.fieldId;
            sumbit.fieldVal = formField.fieldVal;
            sumbit.inputType = [[NSString alloc] initWithFormat:@"%d",formField.inputType];
            [sumbits addObject:sumbit];
        }
    }
    return sumbits;
}

@end
