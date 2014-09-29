//
//  DelCartRequestModel.m
//  lq
//
//  Created by 马涛 on 14-9-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "DelCartRequestModel.h"

@implementation DelCartRequestModel


-(id)init
{
    self = [super init];
    if (self) {
        //
        _uid = [[NSString alloc] init];
        _gid = [[NSString alloc] init];
    }
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"delshoppingcart"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/apigoodshandler.ashx?action=delshoppingcart"];
    
    
    self.request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [self.request addPostValue:token forKey:@"token"];
    
    [self.request addPostValue:_uid forKey:@"uid"];
    [self.request addPostValue:_gid forKey:@"gids"];
    [self.request setRequestMethod:@"POST"];
    
    [self.request setDelegate:self];
    
    [self.request setTag:10001];
    
    NSLog(@"post ready %@",token);
    
    [self.request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)deleteFav
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"delfavorite"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=delfavorite"];
    
    
    self.request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [self.request addPostValue:token forKey:@"token"];
    
    [self.request addPostValue:_uid forKey:@"uid"];
    [self.request addPostValue:_gid forKey:@"gids"];
    [self.request setRequestMethod:@"POST"];
    
    [self.request setDelegate:self];
    
    [self.request setTag:10002];
    
    NSLog(@"post ready %@",token);
    
    [self.request startAsynchronous];
    
    NSLog(@"post already %@",self);
}

-(void)deleteComment
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"delmycommentlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=delmycommentlist"];
    self.request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [self.request addPostValue:token forKey:@"token"];
    
    [self.request addPostValue:_uid forKey:@"uid"];
    [self.request addPostValue:_gid forKey:@"ids"];
    [self.request addPostValue:_sellerId forKey:@"sellerid"];
    [self.request setRequestMethod:@"POST"];
    
    [self.request setDelegate:self];
    
    [self.request setTag:10003];
    
    NSLog(@"post ready %@",token);
    
    [self.request startAsynchronous];
    
    NSLog(@"post already %@",self);
}



-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"post start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    BaseResponseModel *model = [[BaseResponseModel alloc] initWithDic:jsonDic];
    //    model.tag = [super tag];
    
    
    model.ResponseTag = self.tag;
    
    
    
    if (model.ResponseStatus == 1) {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
            [[super delegate] requestSuccess:model];
        }
    }
    else
    {
        if ([[super delegate] respondsToSelector:@selector(requestFailed:)]) {
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
