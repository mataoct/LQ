//
//  WatetFlowRequestModel.h
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "WaterFlowResponseModel.h"
@interface WatetFlowRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;

-(id)initWithSellerid:(NSString *)sellerid start:(NSString *)start limit:(NSString *)limit;

@end
