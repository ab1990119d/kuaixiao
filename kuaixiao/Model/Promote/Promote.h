//
//  Promote.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//  促销申请

/**
 * 促销状态：1、待审批2、审批不通过、3未开始、4促销中、5未结案、6已结案
 */
#define promote_1  1
#define promote_2  2
#define promote_3  3
#define promote_4  4
#define promote_5  5
#define promote_6  6

#import "BaseModel.h"

@interface Promote : BaseModel

/**
 * 主键Id
 */
@property (nonatomic , strong)NSString *promoteId;
/**
 * 促销编号
 */
@property (nonatomic , strong)NSString *promoteNo;
/**
 * 客户名称
 */
@property (nonatomic , strong)NSString *custName;
/**
 * 促销开始时间
 */
@property (nonatomic , strong)NSString *startTime;
/**
 * 促销结束时间
 */
@property (nonatomic , strong)NSString *endTime;
/**
 * 显示状态
 */
@property (nonatomic , strong)NSString *stateDisplay;
/**
 * 促销状态
 */
@property (nonatomic , strong)NSString *state;

//------------添加修改
/**
 * 客户Id
 */
@property  int custId;
/**
 * 促销申请费用
 */
@property  double  sum;
/**
 * 促销负责人ID
 */
@property  int leader;
/**
 * 促销负责人ID
 */
@property  int leaderId;
/**
 * 促销负责人姓名
 */
@property (nonatomic , strong)NSString *leaderName;
/**
 * 审核人Id
 */
@property int  auditorId;
/**
 * 申请用户Id
 */
@property (nonatomic , strong)NSString *userId;
/**
 * 申请人名称
 */
@property (nonatomic , strong)NSString *userName;

/**
 * 促销方式说明
 */
@property (nonatomic , strong)NSString *desc;

/**
 * 促销产品列表
 */
@property (nonatomic , strong)NSMutableArray *promoteProductList;
/**
 * 促销物料列表
 */
@property (nonatomic , strong)NSMutableArray *promoteGoodList;

//----------审批
/**
 * 审核时间
 */
@property (nonatomic , strong)NSString *auditTime;
/**
 * 审核意见
 */
@property (nonatomic , strong)NSString *auditOpinion;
/**
 * 审批用户姓名
 */
@property (nonatomic , strong)NSString *auditName;
/**
 * 审批状态
 */
@property (nonatomic , strong)NSString *auditStateDisplay;

//
///**
// * 客户Id
// */
//private Long custId;
///**
// * 公司Id
// */
//private Long compId;
///**
// * 促销用户Id
// */
//private Long userId;
//
///**
// *促销描述
// */
//private String description;
///**
// *申请状态
// */
//private Integer state;
///**
// * 促销创建时间
// */
//private Date createTime;
///**
// * 促销申请金额
// */
//private Double sum;
///**
// * 备注
// */
//private String memo;
///**
// * 审核人Id
// */
//private Long auditorId;
///**
// * 审核时间
// */
//private Date auditTime;
///**
// * 审核意见
// */
//private String auditOpinion;
///**
// * 促销负责人
// */
//private Long leader;
///**
// * 实际花费
// */
//private Double actualCost;
///**
// * 活动总结
// */
//private String summary;
///**
// * 是否结案
// */
//private Integer close;
///**
// * 结案日期
// */
//private Date closeDate;
///**
// * 活动执行明细
// */
//private String execTxt;
///**
// * 活动执行明细
// */
//private Date execDate;
///**
// * 促销单编号
// */
//private String promoteNo;
//
//
///**
// * 申请人名称
// */
//private String userName;
//
///**
// * 审批用户姓名
// */
//private String auditorName;
//
///**
// * 手机端查询的4种状态
// */
//private Integer phoneState;
///**
// * 促销产品列表
// */
//private List<PromoteProduct> promoteProductList;
///**
// * 促销物料列表
// */
//private List<PromoteGood> promoteGoodList;
@end
