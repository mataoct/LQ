//
//  MyCommentRequestModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyCommentRequestModel.h"

@implementation MyCommentRequestModel

-(id)initWithSeller:(NSString *)sellerId uid:(NSString *)uid start:(NSString *)start limit:(NSString *)limit type:(NSString *)type
{
    self = [super init];
    if (self) {
        //
        
        _sellerId = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        _start = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        _type = [[NSString alloc] init];
        
        _sellerId = sellerId;
        _uid = uid;
        _start = start;
        _limit = limit;
        _type = type;
    }
    
    return self;
}

-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getmycomment"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/ApiUserHandler.ashx?action=getmycomment"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellerId forKey:@"sellerId"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_type forKey:@"type"];
    
    
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
    
    
    MyCommentResponseModel *model= [[MyCommentResponseModel alloc] initWithDic:jsonDic];
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
    NSLog(@"%@ error :: %@",NSStringFromClass(self.class),request.responseString);
    
}

@end
