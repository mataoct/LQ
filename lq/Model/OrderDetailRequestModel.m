//
//  OrderDetailRequestModel.m
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderDetailRequestModel.h"

@implementation OrderDetailRequestModel

-(id)initWithUid:(NSString *)uid orderId:(NSString *)orderId
{
    self = [super init];
    
    if (self) {
        //
        _uid = [[NSString alloc] init];
        _orderId = [[NSString alloc] init];
        
        _orderId = orderId;
        _uid = uid;
        
    }
    return self;

}



-(void)postData
{
    
    
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"getordersdetail"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/handler/api/apigoodshandler.ashx?action=getordersdetail"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_orderId forKey:@"orderid"];
    [request setRequestMethod:@"POST"];
    
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
    
    
    
}
-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"post start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    //        NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    OrderDetailResponseModel *model = [[OrderDetailResponseModel alloc] initWithDic:jsonDic];
    //    model.tag = [super tag];
    
    
    model.ResponseTag = self.tag;
    
    if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
        [[super delegate] requestSuccess:model];
    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"%@ error :: %@",NSStringFromClass(self.class),request.responseString);
}


@end
