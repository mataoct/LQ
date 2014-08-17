//
//  UserCouponViewController.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CouponRequestModel.h"
#import "DiscountTableViewCell.h"


@interface UserCouponViewController : LQUIViewController<RequestModelDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *couponTable;

@property (nonatomic,strong) CouponRequestModel *requestModel;
@property (nonatomic,strong) UserCouponResponseModel *responseModel;


-(id)initWithTitle:(NSString *)str ;

@end
