//
//  CouponRequestModel.m
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponRequestModel.h"

@implementation CouponRequestModel

-(id)initWithSeller:(NSString *)sellerId Start:(NSString *)start Limit:(NSString *)limit
{
    self = [super init];
    
    if (self) {
        //
        
        
        
        _sellerId = [[NSString alloc] init];
        _start = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        
        _sellerId = sellerId;
        _start = start;
        _limit = limit;
        
    }
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"CouponHandler" action:@"getlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/CouponHandler.ashx?action=getlist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    request.tag = 10001;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}

-(void)postUserCoupon;
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getusercouponlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=getusercouponlist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    request.tag = 10002;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}
-(void)postFav
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"myfavorite"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=myfavorite"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    request.tag = 10003;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}

-(void)postForHistory:(NSString *)uid
{
    
    _uid = uid;
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getorderslist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=getorderslist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    request.tag = 10004;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)postIntegral
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getextcreditlog"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=getextcreditlog"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    request.tag = 10005;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);

}
-(void)postBalance
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getmoneylog"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=getmoneylog"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    request.tag = 10006;
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
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
    BaseResponseModel *model = [[BaseResponseModel alloc] init];
    
    switch (request.tag) {
        case 10001:
        {
            model = [[CouponResponseModel alloc] initWithDic:jsonDic];
        }
            break;
        case 10002:
        {
            model = [[UserCouponResponseModel alloc] initWithDic:jsonDic];
        }
            break;
        case 10003:
        {
            model = [[MyFavResponseModel alloc] initWithDic:jsonDic];
        }
            break;
        case 10004:
        {
            model = [[HistoryResponseModel alloc] initWithDic:jsonDic];
        }
            break;
        case 10005:
        {
            model = [[IntegralResponseModel alloc] initWithDic:jsonDic];
        }
            break;
        case 10006:
        {
            model = [[BalanceResponseModel alloc] initWithDic:jsonDic];
        }
            break;
        default:
        {
//            model = [[HistoryResponseModel alloc] initWithDic:jsonDic];
        }
            break;
    }
    
    //    model.tag = [super tag];
    
    
    model.ResponseTag = self.tag;
    
    if (model.ResponseStatus == 1) {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
            [[super delegate] requestSuccess:model];
        }
    }
    else
    {
        if ([[super delegate] respondsToSelector:@selector(requestFailed:)])
        {
            [[super delegate] requestFailed:model.ErrMessage];
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
