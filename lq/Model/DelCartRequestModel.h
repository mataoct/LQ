//
//  DelCartRequestModel.h
//  lq
//
//  Created by 马涛 on 14-9-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface DelCartRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *gid;

@end
