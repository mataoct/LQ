//
//  CouponDetailRequestModel.m
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponDetailRequestModel.h"

@implementation CouponDetailRequestModel


-(id)initWithCouponId:(NSString *)couponId
{
    self = [super init];
    if (self) {
        //
        
        _coupondId = [[NSString alloc] init];
        
        _coupondId = couponId;
    }
    return self;
}


-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"register"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=register"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_coupondId forKey:@"couponid"];
    
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    //    request.tag = 10002;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"main page post start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
    
    CouponModel *model= [[CouponModel alloc] initWithDic:jsonDic];
    model.ResponseTag = self.tag;
//    if (model.ResponseStatus == 1)
//    {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)])
        {
            [[super delegate] requestSuccess:model];
        }
//    }
//    else
//    {
//        if ([[super delegate] respondsToSelector:@selector(requestFailed:)])
//        {
//            [[super delegate] requestFailed:model.ErrMessage];
//        }
//    }
    
    
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
