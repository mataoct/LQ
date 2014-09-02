//
//  WaterDetailRequestModel.m
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WaterDetailRequestModel.h"

@implementation WaterDetailRequestModel


-(id)initWithPid:(NSString *)pid
{
    self = [super init];
    if (self) {
        
        _pid = [[NSString alloc] init];
        _pid = pid;
    }
    return self;
}



-(void)postData
{
    
    
    NSString *token = [CoreHelper tokenController:@"SourceMaterialHandler" action:@"getitem"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/handler/api/SourceMaterialHandler.ashx?action=getitem"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_pid forKey:@"pid"];

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
    WaterDetailResponseModel *model = [[WaterDetailResponseModel alloc] initWithDic:jsonDic];
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
