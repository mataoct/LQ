//
//  OrderDetailViewController.h
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "OrderDetailRequestModel.h"
#import "OrderDetailResponseModel.h"
#import "CartTableViewCell.h"

@interface OrderDetailViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate>

@property (nonatomic,strong) NSString *orderId;
@property (nonatomic,strong) OrderDetailRequestModel *requestModel;
@property (nonatomic,strong) OrderDetailResponseModel *responseModel;

@property (nonatomic,strong) UILabel *orderTypeTitleLabel;
@property (nonatomic,strong) UIButton *takeoutBtn;
@property (nonatomic,strong) UIButton *inRestroomBtn;
@property (nonatomic,strong) UILabel *dinnerTimeLabel;

@property (nonatomic,strong) UILabel *orderInfoTitleLabel;
@property (nonatomic,strong) UIButton *updateOrderInfoBtn;
@property (nonatomic,strong) UILabel *orderAddressLabel;
@property (nonatomic,strong) UILabel *orderTelLabel;
@property (nonatomic,strong) UILabel *orderLinkManLabel;

@property (nonatomic,strong) UILabel *orderDetailTitleLabel;
@property (nonatomic,strong) UITableView *orderTable;
@property (nonatomic,strong) UILabel *orderShippingCostLabel;
@property (nonatomic,strong) UILabel *orderTotalLabel;
@property (nonatomic,strong) UILabel *orderDiscountTotalLabel;

@property (nonatomic,strong) UITextView *messageText;
@property (nonatomic,strong) UILabel *couponCountLabel;
@property (nonatomic,strong) UIButton *couponBtn;

@property (nonatomic,strong) UILabel *payTypeTitleLabel;
@property (nonatomic,strong) UILabel *alipay;


@property (nonatomic,strong) UILabel *totalPayLabel;
@property (nonatomic,strong) UILabel *getIntegrationLabel;
@property (nonatomic,strong) UIButton *submitOrderBtn;


-(id)initWithTitle:(NSString *)str  orderId:(NSString *)orderid;


@end
