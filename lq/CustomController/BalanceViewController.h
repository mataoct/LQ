//
//  BalanceViewController.h
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "IntegralTableViewCell.h"
#import "CouponRequestModel.h"
#import "CYTableView.h"

@interface BalanceViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,CYTableViewDelegate, RequestModelDelegate>


@property (nonatomic,strong) CYTableView *contentTable;
@property (nonatomic,strong) CouponRequestModel *requestModel;
@property (nonatomic,strong) BalanceResponseModel *responseModel;
@property (nonatomic,strong) NSMutableArray *sourceArr;

@end
