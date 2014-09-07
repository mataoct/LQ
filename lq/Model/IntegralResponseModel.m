//
//  IntegralResponseModel.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "IntegralResponseModel.h"

@implementation IntegralResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _integralArr = [[NSMutableArray alloc] init];
        
        NSArray *integralTempArr= [[dic objectForKey:@"data"] objectForKey:@"extcreditlogs"];
        
        for (id integralTemp in integralTempArr) {
            IntegralDetailModel *model = [[IntegralDetailModel alloc] initWithDic:integralTemp];
            [_integralArr addObject:model];
        }
    }
    
    return self;
}

@end
