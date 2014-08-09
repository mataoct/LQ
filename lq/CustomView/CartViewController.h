//
//  CartViewController.h
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "CartRequestModel.h"
#import "ShoppingCartListResponseModel.h"
#import "CartTableViewCell.h"

@interface CartViewController : LQ7ViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) UITableView *cartTable;
@property (nonatomic,strong) UIView *footView;
@property (nonatomic,strong) UILabel *priceCountLabel;
@property (nonatomic,strong) UILabel *priceCountValueLabel;
@property (nonatomic,strong) UIButton *checkBtn;

@property (nonatomic,strong) CartRequestModel *requestModel;
@property (nonatomic,strong) ShoppingCartListResponseModel *responseModel;

@property (nonatomic,strong) NSMutableDictionary  *selectDic;
@end
