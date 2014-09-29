//
//  CancleRequestModel.m
//  lq
//
//  Created by  matao on 14-9-29.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CancleRequestModel.h"

@implementation CancleRequestModel


-(id)init
{
    self = [super init];
    if (self) {
        //
        _orderId = [[NSString alloc] init];
        _status = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
    }
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"updateordersstatus"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/apigoodshandler.ashx?action=updateordersstatus"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_orderId forKey:@"orderid"];
    [request addPostValue:_status forKey:@"status"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    [request setDelegate:self];
    NSLog(@"post ready %@",token);
    [request startAsynchronous];
    
}

-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"  %@ post start",NSStringFromClass(self.class));
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
    
    BaseResponseModel *model= [[BaseResponseModel alloc] initWithDic:jsonDic];
    model.ResponseTag = self.tag;
    if (model.ResponseStatus == 1)
    {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)])
        {
            [[super delegate] requestSuccess:model];
        }
    }
    else
    {
        if ([[super delegate] respondsToSelector:@selector(requestFailed:)])
        {
            [[super delegate] requestFailed:request.responseString];
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
