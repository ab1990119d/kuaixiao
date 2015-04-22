//
//  KSContact.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/2.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "KSContact.h"

static KSContact * _instance;

@implementation KSContact
- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
+ (KSContact *) sharedInstance{
    if (_instance == nil) {
        _instance = [[KSContact alloc] init];
    }
    return _instance;
}
@end
