//
//  AddToCartRequestModel.m
//  lq
//
//  Created by  matao on 14-8-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AddToCartRequestModel.h"

@implementation AddToCartRequestModel

-(id)initWithGid:(NSString *)gid uid:(NSString *)uid
{
    self = [super init];
    if (self) {
        //
        
        
        _gid = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        _num = [[NSString alloc] init];
        
        
        _gid = gid;
        _uid = uid;
    }
    return self;
}


-(void)postData:(NSString *)num
{
    _num = num;
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"addshoppingcart"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/apigoodshandler.ashx?action=addshoppingcart"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_gid forKey:@"gid"];
    [request addPostValue:_num forKey:@"num"];
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
