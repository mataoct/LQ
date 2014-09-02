//
//  HistoryResponseModel.m
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HistoryResponseModel.h"

@implementation HistoryResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    
    if (self) {
        //
        
        _historyArr = [[NSMutableArray alloc] init];
        _unPayArr = [[NSMutableArray alloc] init];
        
        NSArray *historyTempArr= [[dic objectForKey:@"data"] objectForKey:@"orderslist"];
        
        
        for (id hstTemp in historyTempArr) {
//            WaterFlowModel *model = [[WaterFlowModel alloc] initWithDic:waterTemp];
//            [_waterArr addObject:model];
            
            HistoryModel *model = [[HistoryModel alloc] initWithDic:hstTemp];
            
            [_historyArr addObject:model];
            
            if (model.status == 0) {
                [_unPayArr addObject:model];
            }
        }
        
        
    }
    return self;
}

@end
