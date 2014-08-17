//
//  InfoViewController.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "InfoRequestModel.h"
#import "InfoTableViewCell.h"
#import "InfoDetailViewController.h"

@interface InfoViewController : LQ7ViewController<RequestModelDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *infoTable;
@property (nonatomic,strong) InfoRequestModel *model;
@property (nonatomic,strong) InfoResponseModel *responseModel;

@end
