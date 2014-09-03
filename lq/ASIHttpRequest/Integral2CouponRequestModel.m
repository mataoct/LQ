//
//  Integral2CouponRequestModel.m
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "Integral2CouponRequestModel.h"

@implementation Integral2CouponRequestModel

-(id)initWithUid:(NSString *)uid
{
    self = [super init];
    if (self) {
        //
        _uid = [[NSString alloc] init];
        _uid = uid;
        
        _couponId = [[NSString alloc] init];
    }
    return self;
}


-(void)postData:(NSString *)couponId
{
    _couponId = couponId;
    NSString *token = [CoreHelper tokenController:@"CouponHandler" action:@"usercoupon"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/CouponHandler.ashx?action=usercoupon"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_couponId forKey:@"gid"];
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
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)])
        {
            [[super delegate] requestSuccess:model];
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
