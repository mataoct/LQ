//
//  WatetFlowRequestModel.m
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WatetFlowRequestModel.h"

@implementation WatetFlowRequestModel


-(id)initWithSellerid:(NSString *)sellerid start:(NSString *)start limit:(NSString *)limit
{
    self = [super init];
    if (self) {
        //
        
        _sellerId = [[NSString alloc] init];
        _start = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        
        
        
        _start = start;
        _sellerId = sellerid;
        _limit = limit;
    }
    return self;
}



-(void)postData
{
    
    
    NSString *token = [CoreHelper tokenController:@"SourceMaterialHandler" action:@"getlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/handler/api/SourceMaterialHandler.ashx?action=getlist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_start forKey:@"start"];
    [request addPostValue:_limit forKey:@"limit"];
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
    WaterFlowResponseModel *model = [[WaterFlowResponseModel alloc] initWithDic:jsonDic];
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
