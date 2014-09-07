//
//  IntegralDetailModel.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "IntegralDetailModel.h"

@implementation IntegralDetailModel

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
        _orderId =  safeString([dic objectForKey:@"sourceid"]);
        _integral  =  safeString([dic objectForKey:@"extcredit"]);
        _type =  [safeString([dic objectForKey:@"type"]) integerValue];
        
        
        switch (_type) {
            case 1:
                _typeString = @"兑换优惠券";
                break;
            case 2:
                _typeString = @"充值";
                break;
            case 3:
                _typeString = @"签到";
                break;
            case 4:
                _typeString = @"消费";
                break;
            case 11:
                _typeString = @"分享商品";
                break;
            case 12:
                _typeString = @"分享活动";
                break;
            case 13:
                _typeString = @"分享图片墙";
                break;
            case 21:
                _typeString = @"评论商品";
                break;
            case 22:
                _typeString = @"评论活动";
                break;
            case 23:
                _typeString = @"评论图片墙";
                break;
            default:
                break;
        }
        
    }
    
    return self;
}

@end
