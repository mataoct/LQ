  //
//  BaseRequestModel.h
//  lq
//
//  Created by  matao on 14-6-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "BaseResponseModel.h"
#import "CoreHelper.h"


@protocol RequestModelDelegate <NSObject>

@required

-(void)requestSuccess:(BaseResponseModel *)model;
-(void)requestFailed:(NSString *)errorStr;

@end

@interface BaseRequestModel : NSObject<ASIHTTPRequestDelegate>


@property (nonatomic,assign) id<RequestModelDelegate> delegate;
@property (nonatomic,assign) NSInteger tag;

@property (nonatomic,strong) ASIFormDataRequest *request;


-(void)postData;


@end
