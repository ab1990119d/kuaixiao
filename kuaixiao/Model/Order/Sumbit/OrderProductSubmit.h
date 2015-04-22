//
//  OrderProductSubmit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/24.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

@interface OrderProductSubmit : BaseModel

/*** 产品Id */
@property (nonatomic , strong)NSString *proId;
/*** 公司Id */
@property (nonatomic , strong)NSString *compId;
/*** 型号 */
@property (nonatomic , strong)NSString *model;
/*** 产品备注 */
@property (nonatomic , strong)NSString *proMemo;
/*** 目录名称*/
@property (nonatomic , strong)NSString *catalogName;
/*** 产品名称 */
@property (nonatomic , strong)NSString *proName;
/*** 规格 */
@property (nonatomic , strong)NSString *specification;
/*** 目录Id */
@property (nonatomic , strong)NSString *catalogId;
/*** 二维码 */
@property (nonatomic , strong)NSString *barCode;

/*** 价格 */
@property (nonatomic , strong)NSString *price;
/*** 主计量单位Id */
@property (nonatomic , strong)NSString *measureId;
/*** 主计量单位名称 */
@property (nonatomic , strong)NSString *measureName;

//填写的信息
/*** 折扣*/
@property (nonatomic , strong)NSString *discountPercent;
/*** 直减价 */
@property (nonatomic , strong)NSString *discountSub;
/*** 下单时录入价格 */
@property (nonatomic , strong)NSString *inputPrice;
/*** 下单计量单位Id */
@property (nonatomic , strong)NSString *origMeasureId;
/*** 下单计量单位名称 */
@property (nonatomic , strong)NSString *origMeasureName;
/*** 下单数量 */
@property (nonatomic , strong)NSString *origMeasureNum;

@end
