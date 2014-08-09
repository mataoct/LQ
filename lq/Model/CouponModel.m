//
//  CouponModel.m
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponModel.h"

@implementation CouponModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        _couponid = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _expiry = [[NSString alloc] init];
        _extrcedit = [[NSString alloc] init];
        _description = [[NSString alloc] init];
        
        _img = [[NSURL alloc] init];
        
        
        _img = [NSURL URLWithString: safeString([dic objectForKey:@"img"])];
        _couponid = safeString([dic objectForKey:@"couponid"]);
        _expiry =  [CoreHelper timeStampToDate:safeString([dic objectForKey:@"expriy"])] ;
        _extrcedit = safeString([dic objectForKey:@"extcredit"] );
        _title = safeString([dic objectForKey:@"title"]);
        _description = safeString([dic objectForKey:@"description"]);
    }
    
    return self;
}

@end
