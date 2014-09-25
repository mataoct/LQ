//
//  UpdateUserInfoModel.m
//  lq
//
//  Created by  matao on 14-9-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UpdateUserInfoModel.h"

@implementation UpdateUserInfoModel


-(id)init
{
    self = [super init];
    if (self) {
        //
        
        _sellerId = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        _avatar = [[NSString alloc] init];
        _nickName = [[NSString alloc] init];
        _sex = [[NSString alloc] init];
    }
    return self;
}


-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"ApiUserHandler" action:@"modifyuserinfo"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiUserHandler.ashx?action=modifyuserinfo"];
    
    
    self.request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [self.request addPostValue:token forKey:@"token"];
    
    [self.request addPostValue:_uid forKey:@"uid"];
    [self.request addPostValue:_sellerId forKey:@"sellerid"];
    [self.request addPostValue:_avatar forKey:@"avatar"];
    [self.request addPostValue:_nickName forKey:@"nickname"];
    [self.request addPostValue:_sex forKey:@"sex"];
    [self.request setRequestMethod:@"POST"];
    
    [self.request setDelegate:self];
    
    [self.request startAsynchronous];
    
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
