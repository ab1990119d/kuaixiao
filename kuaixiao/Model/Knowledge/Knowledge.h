//
//  Knowledge.h
//  kuaixiao
//
//  Created by 邹克鹏 on 14/12/8.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Knowledge : NSObject
@property (nonatomic , strong)NSString *typeId; // 文件夹id
@property (nonatomic , strong)NSString *typeName; // 文件夹名称
@property (nonatomic , strong)NSString *typeMemo; // 文件夹描述
@property (nonatomic , strong)NSString *knowledgeId; // 文件id
@property (nonatomic , strong)NSString *descr; // 描述
@property (nonatomic , strong)NSString *filepath; // 文件路径
@property (nonatomic , strong)NSString *label; // 文件标签
@property (nonatomic , strong)NSString *filesize;// 文件大小
@property (nonatomic , strong)NSString *filename;// 文件名称
@property (nonatomic , strong)NSString *knowledgeType; // 知识库类型 0 为文件夹, 1为文件
@property (nonatomic , strong)NSString *childTypeCount; // 子目录文件和文件夹的数量
@property (nonatomic , strong)NSString *otherColor; // 新设定的颜色

@end
