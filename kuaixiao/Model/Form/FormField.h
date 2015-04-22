//
//  FormField.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/12.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormField : NSObject

@property (nonatomic , strong)NSString *fieldId; // 字段ID
@property (nonatomic , strong)NSString *formDefId; // 表单定义id
@property (nonatomic , strong)NSString *label; // 字段名称
@property int inputType; // 控件类型:-1分割线, 1单行文本框, 2多行文本框, 3单选框, 5下拉, 6附近(图片)
@property int dataType; // 数据类型: 1字符, 2整数, 3double, 4日期
@property (nonatomic , strong)NSString *format; // 数据格式: yyyy-MM-dd, ####.##
@property int required; // 是否必填 0可为空, 1不可为空
@property int maxVal; // 最大值,最大长度
@property int minVal;// 最小值,最小长度
@property (nonatomic , strong)NSString *positionIndex; // 显示顺序

/**
 *字段选项列表
 */
@property(nonatomic ,strong) NSMutableArray *formFieldItemList;
/**
 * 字段填报值
 */
@property (nonatomic , strong)NSString *fieldVal;

@end
