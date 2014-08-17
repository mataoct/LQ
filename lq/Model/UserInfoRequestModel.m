//
//  UserInfoRequestModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserInfoRequestModel.h"

@implementation UserInfoRequestModel

-(id)initWithSellId:(NSString *)sellerId uid:(NSString *)uid
{
    self = [super init];
    
    if (self) {
        //
        
        _sellerid = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        
        
        _sellerid = sellerId;
        _uid = uid;
    }
    return self;
}


-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getuserinfo"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/ApiUserHandler.ashx?action=getuserinfo"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellerid forKey:@"sellerId"];
    [request addPostValue:_uid forKey:@"uid"];

    [request setRequestMethod:@"POST"];
    //    request.tag = 10002;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"another user info request start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
    
    AnotherUserInfoResponseModel *model= [[AnotherUserInfoResponseModel alloc] initWithDic:jsonDic];
    model.ResponseTag = self.tag;
    if (model.ResponseStatus == 1)
    {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)])
        {
            [[super delegate] requestSuccess:model];
        }
    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"another user info request failed");

}

@end
