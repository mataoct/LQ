//
//  CartRequestModel.m
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CartRequestModel.h"

@implementation CartRequestModel
-(id)initWithUid:(NSString *)uid 
{
    
    self = [super init];
    
    if (self) {
        //
        

        
        _uid = [[NSString alloc] init];
        _uid = uid;
        
        
    }
    return self;
}

-(void)postData
{
    NSString *token = [CoreHelper tokenController:@"ApiGoodsHandler" action:@"getshoppingcartlist"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/Handler/Api/ApiGoodsHandler.ashx?action=getshoppingcartlist"];
    
    
    self.request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [self.request addPostValue:token forKey:@"token"];

    [self.request addPostValue:_uid forKey:@"uid"];
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
    ShoppingCartListResponseModel *model = [[ShoppingCartListResponseModel alloc] initWithDic:jsonDic];
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
