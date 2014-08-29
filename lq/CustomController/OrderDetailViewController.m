//
//  OrderDetailViewController.m
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString *)str orderId:(NSString *)orderid
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        _orderId = [[NSString alloc] init];
        
        _orderId = orderid;
        
        _requestModel = [[OrderDetailRequestModel alloc] initWithUid:[CoreHelper getLoginUid] orderId:_orderId];
        
        _responseModel = [[OrderDetailResponseModel alloc] init];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    _orderShippingCostLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 20)];
    _orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 90, 20)];
    _orderDiscountTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 0, 50, 20)];
    
    _messageText = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 300, 32)];
    
    _couponCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 180, 20)];
    _couponBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 60, 120, 20)];
    
    _payTypeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 300, 20)];
    _alipay = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 300, 32)];
    
    
//    @property (nonatomic,strong) UILabel *totalPayLabel;
//    @property (nonatomic,strong) UILabel *getIntegrationLabel;
//    @property (nonatomic,strong) UIButton *submitOrderBtn;
    
    
    _totalPayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
    _getIntegrationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 120, 20)];
    _submitOrderBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 0, 100, 40)];
    

    
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 214)];
    
    //订单类型
    _orderTypeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 290, 24)];
    _takeoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 34, 100, 20)];
    _inRestroomBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 34, 100, 20)];
    _dinnerTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 57, 260, 20)];
    UIView *tempOrderType = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 80)];
    tempOrderType.backgroundColor = [UIColor whiteColor];
    _orderTypeTitleLabel.font = [UIFont systemFontOfSize:12];
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, 300, 1)];
    line.backgroundColor = BackGray;
    [tempOrderType addSubview:_orderTypeTitleLabel];
    [tempOrderType addSubview:line];
    [tempOrderType addSubview:_takeoutBtn];
    [tempOrderType addSubview:_inRestroomBtn];
    [tempOrderType addSubview:_dinnerTimeLabel];
    [headView addSubview:tempOrderType];
    [_takeoutBtn setTitle:@"送餐" forState:UIControlStateNormal];
    [_inRestroomBtn setTitle:@"到店" forState:UIControlStateNormal];
    _takeoutBtn.backgroundColor = DarkGreen;_inRestroomBtn.backgroundColor = DarkGreen;
    _dinnerTimeLabel.font = [UIFont systemFontOfSize:12];
    
    
    //收货信息
    _orderInfoTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 230, 24)];
    _updateOrderInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(240, 0, 60, 24)];
    _orderAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 34, 290, 20)];
    _orderTelLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 57, 140, 20)];
    _orderLinkManLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 57, 140, 20)];
    
    _orderDetailTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 300, 24)];
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, 300, 1)];
    line2.backgroundColor = BackGray;
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 300, 10)];
    line3.backgroundColor = BackGray;
    UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 114, 300, 1)];
    line4.backgroundColor = BackGray;
    
    _orderInfoTitleLabel.font = [UIFont systemFontOfSize:12];
    _updateOrderInfoBtn.font = [UIFont systemFontOfSize:12];
    [_updateOrderInfoBtn setTitleColor:DarkGreen forState:UIControlStateNormal];
    _orderAddressLabel.font = [UIFont systemFontOfSize:12];
    _orderTelLabel.font = [UIFont systemFontOfSize:12];
    _orderLinkManLabel.font = [UIFont systemFontOfSize:12];
    _orderDetailTitleLabel.font = [UIFont systemFontOfSize:12];
    
    UIView *tempInfo = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 115)];
    tempInfo.backgroundColor = [UIColor whiteColor];
    [tempInfo addSubview:_orderInfoTitleLabel];
    [tempInfo addSubview:_updateOrderInfoBtn];
    [tempInfo addSubview:line2];
    [tempInfo addSubview:_orderAddressLabel];
    [tempInfo addSubview:_orderTelLabel];
    [tempInfo addSubview:_orderLinkManLabel];
    [tempInfo addSubview:_orderDetailTitleLabel];
    [tempInfo addSubview:line3];
    [tempInfo addSubview:line4];
    [headView addSubview:tempInfo];
    
    
    
    
    
    
    
    
    headView.backgroundColor = BackGray;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 300, 150)];
    
    [footView addSubview:_orderShippingCostLabel];
    [footView addSubview:_orderTotalLabel];
    [footView addSubview:_orderDiscountTotalLabel];
    [footView addSubview:_messageText];
    [footView addSubview:_couponCountLabel];
    [footView addSubview:_couponBtn];
    [footView addSubview:_payTypeTitleLabel];
    [footView addSubview:_alipay];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40 , 320, 40)];
    
    [bottomView addSubview:_totalPayLabel];
    [bottomView addSubview:_getIntegrationLabel];
    [bottomView addSubview:_submitOrderBtn];
    
    
    _orderTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 104)];
    
    _orderTable.tableHeaderView = headView;
    _orderTable.tableFooterView = footView;
    _orderTable.delegate = self;
    _orderTable.dataSource = self;
    _orderTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self.view addSubview:_orderTable];
    [self.view addSubview:bottomView];
    
    
    
    
    _requestModel.delegate = self;
    [_requestModel postData];
    
    
    // Do any additional setup after loading the view.
}

-(void)refillLayouts
{
    _orderTypeTitleLabel.text = @"订单类型";
    if (_responseModel.orderType == 0) {
        _inRestroomBtn.selected = false;
        _takeoutBtn.selected = true;
    }
    else
    {
        _inRestroomBtn.selected = true;
        _takeoutBtn.selected = false;
    }
    
    _dinnerTimeLabel.text = [NSString stringWithFormat:@"用餐时间：%@",_responseModel.orderTime];
    
    
    _orderInfoTitleLabel.text = @"收货信息";
    [_updateOrderInfoBtn setTitle:@"修改信息" forState:UIControlStateNormal];
    _orderAddressLabel.text = [NSString stringWithFormat:@"收货地址：%@",_responseModel.address];
    _orderTelLabel.text = [NSString stringWithFormat:@"联系电话：%@",_responseModel.mobile];
    _orderLinkManLabel.text  =  [NSString stringWithFormat:@"联系人：%@",_responseModel.linkMan];
    
    _orderDetailTitleLabel.text = @"订单详情";
    
    [_orderTable reloadData];
    
    _orderShippingCostLabel.text = [NSString stringWithFormat:@"%@元，满60元免配送费",_responseModel.sendPrice];
    _orderTotalLabel.text = [NSString stringWithFormat:@"合计：%@",_responseModel.totalPrice];
    _orderDiscountTotalLabel.text =_responseModel.totalPrice;
    
    _messageText.text = _responseModel.cconttent;
    
    _couponCountLabel.text = [NSString stringWithFormat:@"优惠券：您还剩%@张优惠券", _responseModel.coupondId];
    [_couponBtn setTitle:@"选择" forState:UIControlStateNormal];
    
    _payTypeTitleLabel.text = @"付款方式";
    _alipay.backgroundColor = [UIColor greenColor];
    
    
    _totalPayLabel.text = [NSString stringWithFormat:@"总额：%@",_responseModel.totalPrice];
    _getIntegrationLabel.text = [NSString stringWithFormat:@"获得积分：%@",_responseModel.extCredit];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (OrderDetailResponseModel  *)model;
    [self refillLayouts];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    CartTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CartTableViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_responseModel.goodList objectAtIndex:indexPath.row]];
    cell.selectBtn.hidden = YES;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return [_responseModel.goodList count]?[_responseModel.goodList count]:0;
}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
