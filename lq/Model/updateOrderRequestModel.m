//
//  updateOrderRequestModel.m
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "updateOrderRequestModel.h"

@implementation updateOrderRequestModel


-(id)initWithUid:(NSString *)uid orderId:(NSString *)orderId
{
    self = [super init];
    if (self) {
        //
        
        
        _uid = [[NSString alloc] init];  _uid = uid;
        _orderId = [[NSString alloc] init]; _orderId = orderId;
        
        _orderTime = [[NSString alloc] init];
        _orderPeople = [[NSString alloc] init];
        _orderType = [[NSString alloc] init];
        _couponId = [[NSString alloc] init];
        _address = [[NSString alloc] init];
        _linkMan = [[NSString alloc] init];
        _mobile = [[NSString alloc] init];
        _pid = [[NSString alloc] init];
        _remark = [[NSString alloc] init];
        
    }
    return self;
}



-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"updateorders"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/apigoodshandler.ashx?action=updateorders"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_orderTime forKey:@"ordertime"];
    [request addPostValue:_orderPeople forKey:@"orderpeople"];
    [request addPostValue:_orderType forKey:@"ordertype"];
    [request addPostValue:_couponId forKey:@"couponid"];
    [request addPostValue:_address forKey:@"address"];
    [request addPostValue:_linkMan forKey:@"linkman"];
    [request addPostValue:_mobile forKey:@"mobile"];
    [request addPostValue:_pid forKey:@"pid"];
    [request addPostValue:_remark forKey:@"remark"];
    [request addPostValue:_orderId forKey:@"orderid"];
    [request setRequestMethod:@"POST"];
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
