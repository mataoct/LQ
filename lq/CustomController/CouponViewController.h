//
//  CouponViewController.h
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CouponRequestModel.h"

#import "DiscountTableViewCell2.h"
#import "CouponDetailViewController.h"

#import "LQUINavigationController.h"

#import "UserInfoRequestModel.h"
#import "AnotherUserInfoResponseModel.h"

#import "MJRefresh.h"

@interface CouponViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) UILabel *integralValueLabel;
@property (nonatomic,strong) UITableView *couponTable;
@property (nonatomic,strong) CouponRequestModel *model;
@property (nonatomic,strong) CouponResponseModel *responseModel;

@property (nonatomic,strong) UserInfoRequestModel *requestModel;
@property (nonatomic,strong) AnotherUserInfoResponseModel *userInfoResponseModel;
-(id)initWithTitle:(NSString *)str;

@end
