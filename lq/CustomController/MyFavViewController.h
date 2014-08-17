//
//  MyFavViewController.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CouponRequestModel.h"
#import "MyFavTableViewCell.h"
#import "LQ7ViewController.h"

@interface MyFavViewController : LQ7ViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) CouponRequestModel *requestModel;
@property (nonatomic,strong) MyFavResponseModel *responseModel;

@property (nonatomic,strong) UIButton *allCheckBtn;
@property (nonatomic,strong) UILabel *favCountLabel;
@property (nonatomic,strong) UITableView *favTable;

@property (nonatomic,strong) NSMutableDictionary *selectDic;

@end
