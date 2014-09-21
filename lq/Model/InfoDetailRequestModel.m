//
//  InfoDetailRequestModel.m
//  lq
//
//  Created by  matao on 14-9-21.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoDetailRequestModel.h"

@implementation InfoDetailRequestModel

-(id)initWithNewID:(NSString *)newsId
{
    
    self = [super init];
    
    if (self) {
        _newsId = [[NSString alloc] init];
        
        _newsId = newsId;
    }
    
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"ActiveHandler" action:@"getitem"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ActiveHandler.ashx?action=getitem"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_newsId forKey:@"newid"];

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
    
    
    InfoModel *model= [[InfoModel alloc] initWithDic:[jsonDic objectForKey:@"data"]];
    model.ResponseTag = self.tag;
//    if (model.ResponseStatus == 1)
//    {
        if ([[super delegate] respondsToSelector:@selector(requestSuccess:)])
        {
            [[super delegate] requestSuccess:model];
        }
//    }
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
