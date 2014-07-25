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


@protocol RequestModelDelegate <NSObject>

@required

-(void)requestSuccess:(BaseResponseModel *)model;
-(void)requestFailed;

@end

@interface BaseRequestModel : NSObject<ASIHTTPRequestDelegate>


@property (nonatomic,assign) id<RequestModelDelegate> delegate;


-(void)postData;


@end
