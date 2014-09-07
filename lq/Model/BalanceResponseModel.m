//
//  BalanceResponseModel.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BalanceResponseModel.h"

@implementation BalanceResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _balanceArr = [[NSMutableArray alloc] init];
        
        NSArray *balanceTempArr= [[dic objectForKey:@"data"] objectForKey:@"moneylogs"];
        
        
        
        for (id balanceTemp in balanceTempArr) {
            BalanceDetailModel *model = [[BalanceDetailModel alloc] initWithDic:balanceTemp];
            [_balanceArr addObject:model];
        }
    }
    
    return self;
}

@end
