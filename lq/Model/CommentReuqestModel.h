//
//  CommentReuqestModel.h
//  lq
//
//  Created by 马涛 on 14-7-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "ASIFormDataRequest.h"
#import "CommentListResponseModel.h"

@interface CommentReuqestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;
@property (nonatomic,strong) NSString *gid;


-(id)initWithStart:(NSString *)start Limit:(NSString *)limit  Gid:(NSString *)gid;

-(void)postDataCoupon;

-(void)postDataWaterFlow;

@end
