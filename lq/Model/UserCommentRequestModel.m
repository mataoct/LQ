//
//  UserCommentRequestModel.m
//  lq
//
//  Created by  matao on 14-8-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserCommentRequestModel.h"

@implementation UserCommentRequestModel

-(id)initWithUid:(NSString *)uid
{
    self = [super init];
    if (self) {
        //
        
        _uid = [[NSString alloc] init];
        _uid = uid;
        _message = [[NSString alloc] init];
//        _message = message;
        
    }
    return self;
}


-(void)sendPicComment:(NSString *)pid message:(NSString *)message
{
    
    _pid = [[NSString alloc] init];
    _pid = pid;
    _message = message;
    
    NSString *token = [CoreHelper tokenController:@"SourceMaterialHandler" action:@"imgcomment"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/SourceMaterialHandler.ashx?action=imgcomment"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_message forKey:@"message"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_pid forKey:@"pid"];
    
    [request setRequestMethod:@"POST"];
    request.tag = 10001;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}

-(void)sendGoodComment:(NSString *)gid  message:(NSString *)message
{
    
    _gid = [[NSString alloc] init];
    _gid = gid;
        _message = message;
    
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"addgoodscomment"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/apigoodshandler.ashx?action=addgoodscomment"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_message forKey:@"message"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_gid forKey:@"gid"];
    
    [request setRequestMethod:@"POST"];
    request.tag = 10002;
    [request setDelegate:self];
    
//    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
//    NSLog(@"post already %@",self);
}

-(void)sendCouponComment:(NSString *)couponid  message:(NSString *)message
{
    
    _couponid = [[NSString alloc] init];
    _couponid = couponid;
        _message = message;
    
    NSString *token = [CoreHelper tokenController:@"CouponHandler" action:@"couponcomment"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/CouponHandler?action=couponcomment"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_message forKey:@"message"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_couponid forKey:@"couponid"];
    
    [request setRequestMethod:@"POST"];
    request.tag = 10003;
    [request setDelegate:self];
    
    NSLog(@"post ready %@",token);
    
    [request startAsynchronous];
    
    NSLog(@"post already %@",self);
}


-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"another user info request start");
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    //    NSLog(@"%@",request.responseString);
    
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


@end
