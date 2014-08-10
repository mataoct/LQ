//
//  ShoppingCartItemModel.m
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "ShoppingCartItemModel.h"

@implementation ShoppingCartItemModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        
        _img = [[NSURL alloc] init];
        _gid = [[NSString alloc] init];
        //        _sex = [[NSString alloc] init];
        _totalPrice = [[NSString alloc] init];
        _num = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _mydescription= [[NSString alloc] init];
        _nowPrice = [[NSString alloc] init];
        _originalPrice = [[NSString alloc] init];
        
        
        
        _img = [NSURL URLWithString: safeString([dic objectForKey:@"img"])];
        _gid = safeString([dic objectForKey:@"gid"]);
        _totalPrice = safeString([dic objectForKey:@"totalprice"]);
        _num = safeString([dic objectForKey:@"num"]);
        _title = safeString([dic objectForKey:@"title"]);
        _mydescription = safeString([dic objectForKey:@"description"]);
        _nowPrice = safeString([dic objectForKey:@"nowprice"]);
        _originalPrice = safeString([dic objectForKey:@"originalprice"]);
    }
    return self;
}

@end
