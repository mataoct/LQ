//
//  OrderDetailRequestModel.h
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "OrderDetailResponseModel.h"

@interface OrderDetailRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *orderId;

-(id)initWithUid:(NSString *)uid orderId:(NSString *)orderId;

@end
