//
//  BalanceDetailModel.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BalanceDetailModel.h"

@implementation BalanceDetailModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
        _date = [[NSString alloc]  init];
        _orderId = [[NSString alloc] init];
        _integral = [[NSString alloc] init];
        _typeString = [[NSString alloc] init];
        
        _date = [CoreHelper timeStampToDate:safeString([dic objectForKey:@"createtime"])];
        _orderId =  safeString([dic objectForKey:@"orderid"]);
        _integral  =  safeString([dic objectForKey:@"money"]);
        
        if ([_integral integerValue] >0) {
            _typeString = @"充值";
        }
        else
        {
            _typeString = @"消费";
        }
        
    }
    
    return self;
}


@end
