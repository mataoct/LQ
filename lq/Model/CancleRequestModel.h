//
//  CancleRequestModel.h
//  lq
//
//  Created by  matao on 14-9-29.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface CancleRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString * orderId;
@property (nonatomic,strong) NSString * status;
@property (nonatomic,strong) NSString *uid;

@end
