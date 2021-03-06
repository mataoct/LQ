//
//  CouponRequestModel.h
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "CouponResponseModel.h"
#import "UserCouponResponseModel.h"
#import "MyFavResponseModel.h"
#import "HistoryResponseModel.h"
#import "BalanceResponseModel.h"
#import "IntegralResponseModel.h"

@interface CouponRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;
@property (nonatomic,strong) NSString *uid;

-(id)initWithSeller:(NSString *)sellerId Start:(NSString *)start Limit:(NSString *)limit;
-(void)postUserCoupon;
-(void)postFav;


-(void)postIntegral;
-(void)postBalance;


-(void)postForHistory:(NSString *)uid;
@end
