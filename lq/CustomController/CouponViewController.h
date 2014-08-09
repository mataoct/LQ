//
//  CouponViewController.h
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CouponRequestModel.h"

#import "DiscountTableViewCell.h"
#import "CouponDetailViewController.h"

#import "LQUINavigationController.h"

@interface CouponViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) UILabel *integralValueLabel;
@property (nonatomic,strong) UITableView *couponTable;
@property (nonatomic,strong) CouponRequestModel *model;
@property (nonatomic,strong) CouponResponseModel *responseModel;

-(id)initWithTitle:(NSString *)str;

@end
