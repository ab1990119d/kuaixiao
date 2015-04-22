//
//  OrderChuKuDetail.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/4.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

@interface OrderChuKuDetail : BaseModel

/**产品名称 */
@property (nonatomic , strong)NSString *proName;
/**订单数量 */
@property (nonatomic , strong)NSString *orderNum;
/**出库数量 */
@property (nonatomic , strong)NSString *num;
/**计量单位 */
@property (nonatomic , strong)NSString *measureName;
/**规格 */
@property (nonatomic , strong)NSString *specification;
/**型号*/
@property (nonatomic , strong)NSString *model;
@end
