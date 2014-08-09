//
//  CouponResponseModel.m
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponResponseModel.h"

@implementation CouponResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _couponArr = [[NSMutableArray alloc] init];
        
        NSArray *couponTempArr= [dic objectForKey:@"data"];
        
        
        for (id couponTemp in couponTempArr) {
            CouponModel *model = [[CouponModel alloc] initWithDic:couponTemp];
            [_couponArr addObject:model];
        }
    }
    return self;
}

@end
