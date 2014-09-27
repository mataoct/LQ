//
//  MyHistoryViewController.h
//  lq
//
//  Created by  matao on 14-9-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CouponRequestModel.h"
#import "CartTableViewCell2.h"
#import "HistoryDetailTableViewCell.h"
#import "OrderDetailViewController.h"
#import "MJRefresh.h"

@interface MyHistoryViewController : LQUIViewController<RequestModelDelegate,UITableViewDataSource,UITableViewDelegate,HistoryDetailDelegate>

@property (nonatomic,strong) CouponRequestModel *historyRequest;
@property (nonatomic,strong) HistoryResponseModel *historyResponse;
@property (nonatomic,strong) UISegmentedControl *seg;

@property (nonatomic,strong) UITableView *hstTable;

@end
