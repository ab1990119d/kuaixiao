//
//  KSVisitrecord.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/8.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "KSVisitrecord.h"

static KSVisitrecord * _instance;

@implementation KSVisitrecord
- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (KSVisitrecord *) sharedInstance{
    if (_instance == nil) {
        _instance = [[KSVisitrecord alloc] init];
    }
    return _instance;
}
@end
