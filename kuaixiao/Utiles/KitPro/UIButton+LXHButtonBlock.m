//
//  UIButton+LXHButtonBlock.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/4.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "UIButton+LXHButtonBlock.h"

#import <objc/runtime.h>


@implementation UIButton (Block)


static char overviewKey;


static char paramKey;

@dynamic actions;


- (void) setAction:(NSString*)action withBlock:(void(^)())block {
    
    
    
    if ([self actions] == nil) {
        
        [self setActions:[[NSMutableDictionary alloc] init]];
        
    }
    
    
    
    [[self actions] setObject:block forKey:action];
    
    
    
    if ([kUIButtonBlockTouchUpInside isEqualToString:action]) {
        
        [self addTarget:self action:@selector(doTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}


- (void)setActions:(NSMutableDictionary*)actions {
    
    objc_setAssociatedObject (self, &overviewKey,actions,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


- (NSMutableDictionary*)actions {
    
    return objc_getAssociatedObject(self, &overviewKey);
    
}


- (void)doTouchUpInside:(id)sender {
    
    void(^block)();
    
    block = [[self actions] objectForKey:kUIButtonBlockTouchUpInside];
    
    block();
    
}

- (void)setParam:(NSMutableDictionary *) params {
    
    objc_setAssociatedObject (self, &paramKey,params,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSString*)param {
    
    return objc_getAssociatedObject (self, &paramKey);
    
}

@end