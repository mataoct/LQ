//
//  MenuViewController.h
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "LQUINavigationController.h"
#import "MenuReuqestModel.h"
#import "ProductionRequestModel.h"
#import "MenuTableViewCell.h"
#import "GoodsViewController.h"
@interface MenuViewController : LQ7ViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) UITableView *menuTable;
@property (nonatomic,strong) UIButton *classfy;
@property (nonatomic,strong) UIButton *volume;
@property (nonatomic,strong) UIButton *time;
@property (nonatomic,strong) UIButton *price;
@property (nonatomic,strong) MenuReuqestModel *menuRequest;
@property (nonatomic,strong) ProductionRequestModel *productionModel;

@property (nonatomic,strong) MenuResponseModel *menuResponseModel;



//@property (nonatomic,strong) UIButton *classbtn;


@end
