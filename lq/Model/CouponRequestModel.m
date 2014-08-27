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
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/CouponHandler.ashx?action=getlist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request setRequestMethod:@"POST"];
    request.tag = 10001;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}

-(void)postUserCoupon;
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getusercouponlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/ApiUserHandler.ashx?action=getusercouponlist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.tag = 10002;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}
-(void)postFav
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"myfavorite"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/ApiUserHandler.ashx?action=myfavorite"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_uid forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    request.tag = 10003;
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
        default:
        {
            
        }
            break;
    }
    
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
