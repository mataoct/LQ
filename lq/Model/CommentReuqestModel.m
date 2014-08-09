//
//  CommentReuqestModel.m
//  lq
//
//  Created by 马涛 on 14-7-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CommentReuqestModel.h"

@implementation CommentReuqestModel
-(id)initWithStart:(NSString *)start Limit:(NSString *)limit Gid:(NSString *)gid
{
    
    self = [super init];
    
    if (self) {
        //
        
        _start = [[NSString alloc] init];
        _start = start;
        
        _limit = [[NSString alloc] init];
        _limit = limit;
        
        _gid = [[NSString alloc] init];
        _gid = gid;
        
        
    }
    return self;
}

-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"ApiGoodsHandler" action:@"getgoodscomments"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/ApiGoodsHandler.ashx?action=getgoodscomments"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_gid forKey:@"gid"];
    [request setRequestMethod:@"POST"];
    
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}

-(void)postDataCoupon
{
    NSString *token = [CoreHelper tokenController:@"CouponHandler" action:@"couponcommentlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/CouponHandler.ashx?action=couponcommentlist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
    [request addPostValue:_gid forKey:@"couponid"];
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
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    CommentListResponseModel *model = [[CommentListResponseModel alloc] initWithDic:jsonDic];
    //    model.tag = [super tag];
    
    
    model.ResponseTag = self.tag;
    
    if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
        [[super delegate] requestSuccess:model];
    }
    
    
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
}


@end