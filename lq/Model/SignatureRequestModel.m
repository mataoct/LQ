//
//  SignatureRequestModel.m
//  lq
//
//  Created by  matao on 14-8-9.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SignatureRequestModel.h"

@implementation SignatureRequestModel

-(id)initWithSeller:(NSString *)sellerId uid:(NSString *)uid args:(NSArray *)args
{
    
    self = [super init];
    
    if (self) {
        //
        _argsArr = [[NSArray alloc] initWithArray:args];
        _sellerId = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        _gids = [[NSString alloc] init];
        _nums = [[NSString alloc] init];
        
        
        
        _sellerId = sellerId;
        _uid = uid;
        
    }
    return self;
}



-(void)postData
{
    
    for (ShoppingCartItemModel *itemModel in _argsArr) {
        //
        
        _gids = [_gids stringByAppendingFormat:@"%@,",itemModel.gid];
        
        _nums = [_nums stringByAppendingFormat:@"%@,",itemModel.num];
    }
    
    _gids =  [_gids substringToIndex:_gids.length - 1];
    _nums = [_nums substringToIndex:_nums.length - 1];
    
    
    
    NSString *token = [CoreHelper tokenController:@"apigoodshandler" action:@"addorders"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.mto2o.cn/bg/handler/api/apigoodshandler.ashx?action=addorders"];
    
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:token forKey:@"token"];
    
    [request addPostValue:_sellerId forKey:@"sellerid"];
    [request addPostValue:_uid forKey:@"uid"];
    [request addPostValue:_nums forKey:@"nums"];
    [request addPostValue:_gids forKey:@"gids"];
    [request setRequestMethod:@"POST"];
    
    [request setDelegate:self];
    
    [request startAsynchronous];
    
    
    
}
-(void)requestStarted:(ASIHTTPRequest *)request
{
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    SignatureResponseModel *model = [[SignatureResponseModel alloc] initWithDic:jsonDic];
    
    model.ResponseTag = self.tag;
    
    if ([[super delegate] respondsToSelector:@selector(requestSuccess:)]) {
        NSLog(@"order init success %@",jsonDic);
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
