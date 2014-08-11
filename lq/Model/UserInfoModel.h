//
//  UserInfoModel.h
//  lq
//
//  Created by  matao on 14-8-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface UserInfoModel : BaseResponseModel


@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,strong) NSURL *avatar;



@end
