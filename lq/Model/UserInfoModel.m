//
//  UserInfoModel.m
//  lq
//
//  Created by  matao on 14-8-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _uid = [[NSString alloc] init];
        _sellerId = [[NSString alloc] init];
        _phone = [[NSString alloc] init];
        _nickName = [[NSString alloc] init];
        _avatar = [[NSURL alloc] init];
        
        
        
        _uid = safeString([[dic objectForKey:@"data"] objectForKey:@"uid"]);
        _sellerId = safeString([[dic objectForKey:@"data"] objectForKey:@"sellerid"]);
        _phone = safeString([[dic objectForKey:@"data"] objectForKey:@"phone"]);
        _nickName = safeString([[dic objectForKey:@"data"] objectForKey:@"nickname"]);
        _avatar = [NSURL URLWithString:safeString([[dic objectForKey:@"data"] objectForKey:@"avatar"])];
        _sex = [safeString([[dic objectForKey:@"data"] objectForKey:@"orderid"]) integerValue];
    }
    
    return self;
}

@end
