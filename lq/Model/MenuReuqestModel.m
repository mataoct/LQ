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
