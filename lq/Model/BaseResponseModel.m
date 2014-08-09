//
//  BaseResponseModel.m
//  lq
//
//  Created by 马涛 on 14-7-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@implementation BaseResponseModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
//        NSLog(@"dic %@",dic);
        
        
        if ([[dic objectForKey:@"status"] integerValue] != 1) {
            
            NSLog(@"接口返回错误");
            
            return nil;
        }
        
    }
    return self;
}

@end
