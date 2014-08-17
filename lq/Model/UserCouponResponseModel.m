//
//  UserCouponResponseModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserCouponResponseModel.h"

@implementation UserCouponResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _extcredit = [[NSString alloc] init];
        _couponArr = [[NSMutableArray alloc] init];
        
        _extcredit = [[dic objectForKey:@"data"]  objectForKey:@"extcredit"];
        
        NSArray *couponTempArr= [[dic objectForKey:@"data"] objectForKey:@"couponlist"];
        for (id couponTemp in couponTempArr) {
            CouponModel *model = [[CouponModel alloc] initWithDic:couponTemp];
            [_couponArr addObject:model];
        }
    }
    return self;
}
@end
