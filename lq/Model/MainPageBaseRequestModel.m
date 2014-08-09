   //
//  MainPageBaseRequestModel.m
//  lq
//
//  Created by  matao on 14-6-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MainPageBaseRequestModel.h"
#import "BaseResponseModel.h"

@implementation MainPageBaseRequestModel

-(id)initWithSellId:(NSString *)sellerId
{
    self = [super init];
    if (self) {
        //
        
        _sellId = [[NSString alloc] init];
        
        _sellId = sellerId;
        
    }
    return self;
}






-(void)postData
{
    
    NSString *token = [CoreHelper tokenController:@"ApiGoodsHandler" action:@"getpageinfo"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://182.254.137.180/bg/Handler/Api/ApiGoodsHandler.ashx?action=getpageinfo"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:_sellId forKey:@"sellerId"];
    [request setRequestMethod:@"POST"];
    
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
    MainResponseModel *model = [[MainResponseModel alloc] initWithDic:jsonDic];
    if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
        [[super delegate] requestSuccess:model];
    }
    
    

}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
}





@end
