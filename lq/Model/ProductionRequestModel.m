//
//  ProductionRequestModel.m
//  lq
//
//  Created by 马涛 on 14-7-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "ProductionRequestModel.h"

@implementation ProductionRequestModel

-(id)initWithSellId:(NSString *)sellerId Gid:(NSString *)gid
{
    self = [super init];
    if (self) {
        //
        _sellId = [[NSString alloc] init];
        _gid = [[NSString alloc] init];
        
        _sellId = sellerId;
        _gid = gid;
    }
    return self;
}


-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiGoodsHandler" action:@"getgoodsdetail"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiGoodsHandler.ashx?action=getgoodsdetail"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellId forKey:@"sellerId"];
    [request addPostValue:_gid forKey:@"gid"];
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
    //    NSLog(@"%@",request.responseString);
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    ProdutionResponseModel *model = [[ProdutionResponseModel alloc] initWithDic:jsonDic];
//    model.tag = [super tag];
    
    
    model.ResponseTag = self.tag;
    
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
