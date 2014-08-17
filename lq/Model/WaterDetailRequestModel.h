//
//  WaterDetailRequestModel.h
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "WaterDetailResponseModel.h"

@interface WaterDetailRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *pid;


-(id)initWithPid:(NSString *)pid;

@end
