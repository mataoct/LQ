//
//  LoginRequestModel.m
//  lq
//
//  Created by  matao on 14-7-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LoginRequestModel.h"

@implementation LoginRequestModel


-(id)initWithUsername:(NSString *)username Pwd:(NSString *)userpwd sellerId:(NSString *)sellerID;
{
    self = [super init];
    if (self) {
        //
        _username = [[NSString alloc] init];
        _userpwd = [[NSString alloc] init];
        _sellerID = [[NSString alloc] init];

        _userpwd = userpwd;
        _username = username;
        _sellerID = sellerID;
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
        {
            NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"login"];
            
            NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=login"];
            
            
            ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
            
            
            [request addPostValue:token forKey:@"token"];
            [request addPostValue:_sellerID forKey:@"sellerId"];
            [request addPostValue:_username forKey:@"phone"];
            [request addPostValue:_userpwd forKey:@"password"];
            
            [request setRequestMethod:@"POST"];
            request.defaultResponseEncoding = NSUTF8StringEncoding;
            
            [request setDelegate:self];
            
            NSLog(@"post ready %@",token);
            
            [request startAsynchronous];
        }
            
            
            
            break;
    }
}

-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"main page post start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
    
    UserInfoModel *model= [[UserInfoModel alloc] initWithDic:jsonDic];
    model.ResponseTag = request.tag;
    if (model.ResponseStatus == 1)
    {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)])
        {
            [CoreHelper setLoginInfo:jsonDic];
            [[super delegate] requestSuccess:model];
        }
    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"%@ error :: %@",NSStringFromClass(self.class),request.responseString);
    if ([[super delegate] respondsToSelector:@selector(requestFailed:)])
    {
        [[super delegate] requestFailed:request.responseString];
    }
}



@end
