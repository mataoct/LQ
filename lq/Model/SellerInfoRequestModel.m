//
//  SellerInfoRequestModel.m
//  lq
//
//  Created by  matao on 14-8-14.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SellerInfoRequestModel.h"

@implementation SellerInfoRequestModel

-(id)initWithSeller:(NSString *)sellerid
{
    self = [super init];
    if (self) {
        //
        _sellerid = [[NSString alloc] init];
        _sellerid = sellerid;
        
    }
    return self;
}

-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getmerchant"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=getmerchant"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellerid forKey:@"sellerid"];
    [request setRequestMethod:@"POST"];
    
    [request setDelegate:self];
    
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    
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
    SellerInfoResponseModel *model = [[SellerInfoResponseModel alloc] initWithDic:jsonDic];
    if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
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
