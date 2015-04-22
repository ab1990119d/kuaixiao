//
//  KuaiXiaoTool.m
//  kuaixiao
//
//  Created by 邹克鹏 on 14/11/21.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "KuaiXiaoTool.h"

@implementation KuaiXiaoTool

+(void)showAlert:(NSString*)alertString
{
//    if (IOS8) {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertString preferredStyle:UIAlertControllerStyleAlert];
//        [view presentViewController:alert animated:NO completion:nil];
//        
//    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:alertString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
//    }
    
}
+(NSString *)lastStringWithString:(NSString *)str{
    NSString *lastStr = [str pathExtension];
    if ([lastStr isEqualToString:@"jpg"]||[lastStr isEqualToString:@"png"]) {
        lastStr = @"jpg";
    }else if([lastStr isEqualToString:@"doc"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"html"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"mp3"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"pdf"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"ppt"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"txt"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"video"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"xls"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"zip"]){
        lastStr = lastStr;
    }else if([lastStr isEqualToString:@"zip"]){
        lastStr = lastStr;
    }else{
        lastStr = @"unknow";
    }
    return lastStr;
}

+(NSString *)jiDuWithMonth:(NSInteger)jiDu{
    NSString *str;
    switch (jiDu) {
        case 1:
        {
            str = @"1,2,3";
        }
            break;
        case 2:
        {
            str = @"4,5,6";
        }
            break;
        case 3:
        {
            str = @"7,8,9";
        }
            break;
        case 4:
        {
            str = @"10,11,12";
        }
            break;
        default:
            break;
    }
    return str;
}
+ (NSArray *)pickViewArray{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 1990; i <= 2100; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d年",i];
        [arr addObject:str];
    }
    NSMutableArray *mouthArr = [NSMutableArray array];
    for (int i = 1; i <= 12; i ++) {
        NSString *str = [NSString stringWithFormat:@"%02d月",i];
        [mouthArr addObject:str];
    }
    [mouthArr addObject:@"全年"];
    [mouthArr addObject:@"1季度"];
    [mouthArr addObject:@"2季度"];
    [mouthArr addObject:@"3季度"];
    [mouthArr addObject:@"4季度"];
    NSArray *allArr = @[arr,mouthArr];
    return allArr;
}
+(NSString *)stringTOjson:(id)temps   //把字典和数组转换成json字符串
{
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:temps
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    NSString *strs=[[NSString alloc] initWithData:jsonData
                                         encoding:NSUTF8StringEncoding];
    return strs;
}
+(NSString *)postStrWithString:(NSString *)str{
    NSString *postStr;
    NSString *year = [str substringToIndex:4];
    if ([str hasSuffix:@"年"]) {
        postStr = [NSString stringWithFormat:@"%@-%@",year,year];
    }else if([str hasSuffix:@"度"]){
        NSInteger jidu = [[str substringWithRange: NSMakeRange(5, 1)]integerValue];
        postStr = [NSString stringWithFormat:@"%@-%@",year,[self jiDuWithMonth:jidu]];
    }else{
        NSString *month = [str substringWithRange:NSMakeRange(5, 2)];
        postStr = [NSString stringWithFormat:@"%@-%@",year,month];
    }
    return postStr;
}

@end
