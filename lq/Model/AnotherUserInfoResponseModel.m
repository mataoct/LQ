//
//  AnotherUserInfoResponseModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AnotherUserInfoResponseModel.h"

@implementation AnotherUserInfoResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        
        _userName = [[NSString alloc] init];
        _phone = [[NSString alloc] init];
        _avatar = [[NSURL alloc] init];
        _money = [[NSString alloc] init];
        _sellerId = [[NSString alloc] init];
        _integral = [[NSString alloc] init];
//        _signin = [[NSString alloc] init];
        _signIntegral = [[NSString alloc] init];
        
    
        _userName = safeString([[dic objectForKey:@"data"] objectForKey:@"username"]);
        _phone = safeString([[dic objectForKey:@"data"] objectForKey:@"phone"]);
        _avatar = [NSURL URLWithString:[safeString([[dic objectForKey:@"data"] objectForKey:@"avatar"]) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        _money = safeString([[dic objectForKey:@"data"] objectForKey:@"money"]);
        _sellerId = safeString([[dic objectForKey:@"data"] objectForKey:@"sellerid"]);
        _integral = safeString([[dic objectForKey:@"data"] objectForKey:@"integral"]);
        _signin = [safeString([[dic objectForKey:@"data"] objectForKey:@"signin"]) integerValue];
        _sex =[safeString([[dic objectForKey:@"data"] objectForKey:@"sex"]) integerValue];
        _signIntegral = safeString([[dic objectForKey:@"data"] objectForKey:@"signintegral"]);
        
    }
    return self;
    
}

@end
