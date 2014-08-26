//
//  AddressResponseModel.m
//  lq
//
//  Created by  matao on 14-8-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AddressResponseModel.h"

@implementation AddressResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _linkMan = [[NSString alloc] init];
        _phone = [[NSString alloc] init];
        _address = [[NSString alloc] init];
        _sellerid = [[NSString alloc] init];
        

        _linkMan = safeString([[dic objectForKey:@"data"] objectForKey:@"linkMan"]);
        _phone = safeString([[dic objectForKey:@"data"] objectForKey:@"phone"]);
        _address = safeString([[dic objectForKey:@"data"] objectForKey:@"address"]);
        _sellerid = safeString([[dic objectForKey:@"data"] objectForKey:@"sellerid"]);
    }
    
    return self;
}

@end
