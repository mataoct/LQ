//
//  PasswordRequestModel.m
//  lq
//
//  Created by 马涛 on 14-9-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "PasswordRequestModel.h"

@implementation PasswordRequestModel

-(id)init
{
    self = [super init];
    if (self) {
        //
        _oldPwd = [[NSString alloc] init];
        _sellerId = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        _pwd = [[NSString alloc] init];
    }
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"modifypwd"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=modifypwd"];
    
    
    self.request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [self.request addPostValue:token forKey:@"token"];
    
    [self.request addPostValue:_uid forKey:@"uid"];
    [self.request addPostValue:_sellerId forKey:@"sellerid"];
    [self.request addPostValue:_pwd forKey:@"newpwd"];
    [self.request addPostValue:_oldPwd forKey:@"oldpwd"];
//    [self.request addPostValue:_sex forKey:@"sex"];
    [self.request setRequestMethod:@"POST"];
    
    [self.request setDelegate:self];
    
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
