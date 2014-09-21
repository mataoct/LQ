//
//  MenuReuqestModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MenuReuqestModel.h"

@implementation MenuReuqestModel


-(id)initWithSellId:(NSString *)sellerId uid:(NSString *)uid
{
    self = [super init];
    if (self) {
        //
        _sellId = [[NSString alloc] init];
        _sellId = sellerId;
        
        _uid = [[NSString alloc] init];
        _uid = uid;
        
        _cid = [[NSString alloc] init];
        _start = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        
    }
    return self;
}

-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiGoodsHandler" action:@"getgoodslist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiGoodsHandler.ashx?action=getgoodslist"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellId forKey:@"sellerId"];
    [request addPostValue:_uid forKey:@"uid"];
    if (_start && ![_start isEqualToString:@""]) {
        [request addPostValue:_start forKey:@"start"];
    }
    if (_limit && ![_limit isEqualToString:@""]) {
        [request addPostValue:_limit forKey:@"limit"];
    }
    
    
    if (_cid && ![_cid isEqualToString:@""]) {
        [request addPostValue:_cid forKey:@"cid"];
    }

    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    
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
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    MenuResponseModel *model = [[MenuResponseModel alloc] initWithDic:jsonDic];
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
