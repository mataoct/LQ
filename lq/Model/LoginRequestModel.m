//
//  LoginRequestModel.m
//  lq
//
//  Created by  matao on 14-7-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LoginRequestModel.h"

@implementation LoginRequestModel


-(id)initWithUsername:(NSString *)username Pwd:(NSString *)userpwd
{
    self = [super init];
    if (self) {
        //
        _username = [[NSString alloc] init];
        _userpwd = [[NSString alloc] init];

        _userpwd = userpwd;
        _username = username;
        
        _tokenType = 0;
    }
    return self;
}

-(id)initWithTokens:(NSString *)token tokenType:(enum tokens)tokentype
{
    self = [super init];
    if (self) {
        //
        _token = [[NSString alloc] init];
        
        _token = token;
        
        _tokenType = tokentype;
        
    }
    return self;
}

-(void)postData
{
    switch (_tokenType) {
        case qqToken:
            //
            break;
        case sinaToken:
            //
            break;
        default:
            break;
    }
}


@end
