//
//  ChanceRecord.h
//  kuaixiao
//
//  Created by 邹克鹏 on 14/12/24.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChanceRecord : NSObject
@property (nonatomic)long recordId;

@property (nonatomic)long chanceId;

@property (nonatomic , strong)NSString *content;

@property (nonatomic , strong)NSString *createtime;

@property (nonatomic)long userId;//创建者Id

@property (nonatomic , strong)NSString *userName;//创建者名称

@property (nonatomic , strong)NSString *userMinPhoto;//创建者头像


@property (nonatomic , strong)NSString *voicePath;// 录音文件路径
@property (nonatomic)double voiceSize;// 录音文件大小(单位：B)
@property (nonatomic)int voiceDuration;// 录音文件时长(单位：秒)
@property (nonatomic)double imgLongitude;// 图片定位经度
@property (nonatomic)double imgLatitude;// 图片定位纬度
@property (nonatomic , strong)NSString *imgLocation;// 图片定位地址
@property (nonatomic , strong)NSArray *chanceRordpic;//记录图片列表
@property (nonatomic , strong)NSString *picList;//记录图片列表
@end
