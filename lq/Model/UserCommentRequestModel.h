//
//  UserCommentRequestModel.h
//  lq
//
//  Created by  matao on 14-8-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface UserCommentRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *message;

@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *couponid;
@property (nonatomic,strong) NSString *newid;
@property (nonatomic,strong) NSString *gid;

-(id)initWithUid:(NSString *)uid;

-(void)sendCouponComment:(NSString *)couponid  message:(NSString *)message;
-(void)sendGoodComment:(NSString *)gid  message:(NSString *)message;
-(void)sendPicComment:(NSString *)pid message:(NSString *)message;
@end
