//
//  FrontMenuViewController.h
//  lq
//
//  Created by  matao on 14-10-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"

#import "MenuReuqestModel.h"
#import "FrontMenuTableViewCell.h"
#import "MenuForEnterpriceController.h"

@interface FrontMenuViewController : LQ7ViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) UITableView *cateTable;

@property (nonatomic,strong) MenuReuqestModel *menuRequestModel;
@property (nonatomic,strong) MenuResponseModel *menuResponseModel;

@property (nonatomic,strong) NSMutableArray *categoryArr;


@property (nonatomic,strong) MenuForEnterpriceController *menuVC;

@end
