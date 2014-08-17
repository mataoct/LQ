//
//  SellerInfoResponseModel.m
//  lq
//
//  Created by  matao on 14-8-14.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SellerInfoResponseModel.h"

@implementation SellerInfoResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _name = [[NSString alloc] init];
        _address = [[NSString alloc] init];
        _phone = [[NSString alloc] init];
        _myDescription = [[NSString alloc] init];
        _mapUrl = [[NSString alloc] init];
        
        
        _name = safeString([[dic objectForKey:@"data"] objectForKey:@"name"]);
        _address = safeString([[dic objectForKey:@"data"] objectForKey:@"address"]);
        _phone = safeString([[dic objectForKey:@"data"] objectForKey:@"phone"]);
        _myDescription = safeString([[dic objectForKey:@"data"] objectForKey:@"description"]);
        _mapUrl = safeString([[dic objectForKey:@"data"] objectForKey:@"mapurl"]);
        
        _pointx = [safeString([[dic objectForKey:@"data"] objectForKey:@"pointx"]) floatValue];
        _pointy = [safeString([[dic objectForKey:@"data"] objectForKey:@"pointy"]) floatValue];
    }
    
    return self;
}

@end
