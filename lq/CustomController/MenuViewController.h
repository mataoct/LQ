//
//  MenuViewController.h
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"

@interface MenuViewController : LQ7ViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *menuTable;
@property (nonatomic,strong) UIButton *classfy;
@property (nonatomic,strong) UIButton *volume;
@property (nonatomic,strong) UIButton *time;
@property (nonatomic,strong) UIButton *price;


//@property (nonatomic,strong) UIButton *classbtn;


@end
