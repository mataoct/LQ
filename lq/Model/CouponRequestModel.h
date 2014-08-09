//
//  CouponRequestModel.h
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "CouponResponseModel.h"
@interface CouponRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;


-(id)initWithSeller:(NSString *)sellerId Start:(NSString *)start Limit:(NSString *)limit;

@end
