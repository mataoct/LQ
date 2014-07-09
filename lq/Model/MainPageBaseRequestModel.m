//
//  MainPageBaseRequestModel.m
//  lq
//
//  Created by  matao on 14-6-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MainPageBaseRequestModel.h"

@implementation MainPageBaseRequestModel

-(id)initWithSellId:(NSString *)sellerId
{
    self = [super init];
    if (self) {
        //
        
        _sellId = [[NSString alloc] init];
        
        _sellId = sellerId;
        
    }
    return self;
}






-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"controller" action:@"action"];
    
    NSURL *url = [[NSURL alloc] initWithString:@""];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellId forKey:@"sellerId"];
    [request setRequestMethod:@"POST"];
    
    [request setDelegate:self];
    
    [request startAsynchronous];
}


-(void)requestStarted:(ASIHTTPRequest *)request
{
    
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
}





@end
