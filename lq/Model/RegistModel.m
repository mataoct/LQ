//
//  RegistModel.m
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "RegistModel.h"

@implementation RegistModel


-(id)initWithTel:(NSString *)tel {
    self = [super init];
    if (self) {
        //
        _tel = [[NSString alloc] init];
        _tel = tel;
        

    }
    
    return self;
    
}

-(void)fillModelWithverifyCode:(NSString *)verifyCode nikcName:(NSString *)nickName pwd:(NSString *)pwd
{
    _verifyCode = [[NSString alloc] init];
    _verifyCode = verifyCode;
    
    _nikcName = [[NSString alloc] init];
    _nikcName = nickName;
    
    _pwd = [[NSString alloc] init];
    _pwd = pwd;
}


-(void)getVerifyCodeByTel
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"getregistercode"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=getregistercode"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_tel forKey:@"phone"];
    [request addPostValue:@"100" forKey:@"sellerId"];
    [request setRequestMethod:@"POST"];
//    request.tag = 10001;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"register"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=register"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:@"100" forKey:@"sellerId"];
    [request addPostValue:_tel forKey:@"username"];
    [request addPostValue:_verifyCode forKey:@"code"];
    [request addPostValue:_tel forKey:@"phone"];
    [request addPostValue:_pwd forKey:@"password"];
    
    [request setRequestMethod:@"POST"];
//    request.tag = 10002;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"main page post start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    //    NSLog(@"%@",request.responseString);
    
    
    
    
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
    
    RegisterResponseModel *model= [[RegisterResponseModel alloc] initWithDic:jsonDic];
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
}
@end
