//
//  InfoRequestModel.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoRequestModel.h"

@implementation InfoRequestModel


-(id)initWithSeller:(NSString *)sellerId Start:(NSString *)start Limit:(NSString *)limit
{
    self = [super init];
    
    if (self) {
        //
        
        
        
        _sellerId = [[NSString alloc] init];
        _start = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        
        _sellerId = sellerId;
        _start = start;
        _limit = limit;
        
    }
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"ActiveHandler" action:@"getlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ActiveHandler.ashx?action=getlist"];
    
    
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
    NSLog(@"post start .......");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    InfoResponseModel *model = [[InfoResponseModel alloc] initWithDic:jsonDic];
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
