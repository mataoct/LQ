//
//  UpdateUserInfoModel.h
//  lq
//
//  Created by  matao on 14-9-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface UpdateUserInfoModel : BaseRequestModel


@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *avatar;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *sex;

@end
