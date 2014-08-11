//
//  SignatureResponseModel.m
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SignatureResponseModel.h"

@implementation SignatureResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _orderId = [[NSString alloc] init];
        
        _orderId = safeString([[dic objectForKey:@"data"] objectForKey:@"orderid"]);
        
    }
    return self;
    
}

@end
