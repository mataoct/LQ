//
//  WaterFlowResponseModel.m
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WaterFlowResponseModel.h"

@implementation WaterFlowResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _waterArr = [[NSMutableArray alloc] init];
        
        NSArray *waterTempArr= [dic objectForKey:@"data"];
        
        
        for (id waterTemp in waterTempArr) {
            WaterFlowModel *model = [[WaterFlowModel alloc] initWithDic:waterTemp];
            [_waterArr addObject:model];
        }
        
    }
    return self;
}

@end
