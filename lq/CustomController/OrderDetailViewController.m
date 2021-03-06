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
        _updateRequestModel = [[updateOrderRequestModel alloc] initWithUid:[CoreHelper getLoginUid] orderId:_orderId];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kCouponUse" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(couponHasBeenUsed:) name:@"kCouponUse" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kAddressChange" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addressChange:) name:@"kAddressChange" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kPaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccess) name:@"kPaySuccess" object:nil];
    
    
    
    
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn. frame=CGRectMake(15, 5, 23, 23);
    [btn setBackgroundImage:[UIImage imageNamed:@"标题--电话.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selectRightAction:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *call=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    self.item.rightBarButtonItem = call;
 
    
    _totalPayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 3, 120, 17)];
    _getIntegrationLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 120, 17)];
    _submitOrderBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 5, 100, 30)];
    [_submitOrderBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [_submitOrderBtn setBackgroundColor:Pink];
    _submitOrderBtn.layer.cornerRadius = 5.0;
    _submitOrderBtn.font = [UIFont systemFontOfSize:14];
    [_submitOrderBtn addTarget:self action:@selector(payForOrder) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 214)];
    
    //订单类型
    _orderTypeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 290, 24)];
    _inRestroomBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 34, 100, 20)];
    _takeoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 34, 100, 20)];
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

    
    [_takeoutBtn addTarget:self action:@selector(takeOutBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [_inRestroomBtn addTarget:self action:@selector(inRestroomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
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
    

    
    _orderShippingCostLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 160, 24)];
    _orderShippingCostLabel.font = [UIFont systemFontOfSize:10];
    _orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 0, 90, 24)];
    _orderTotalLabel.font = [UIFont systemFontOfSize:12];
    _orderDiscountTotalLabel = [[DisLineLabel alloc] initWithFrame:CGRectMake(250, 0, 36, 24)];
    _orderDiscountTotalLabel.font = [UIFont systemFontOfSize:10];
    _messageText = [[UITextView alloc] initWithFrame:CGRectMake(10, 34, 280, 50)];
    _messageText.backgroundColor = BackGray;
    _messageText.delegate = self;
    _messageText.returnKeyType = UIReturnKeyDone;
    
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *hiddenButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"隐藏键盘" style:UIBarButtonItemStyleDone target:self action:@selector(inputDown:)];
    UIBarButtonItem *send = [[UIBarButtonItem alloc] initWithTitle:@"修改备注" style:UIBarButtonItemStylePlain target:self action:@selector(updateDescription)];
    
    [toolbar setItems:@[send,hiddenButtonItem]];
    
//    UIButton *inputDone = [[UIButton alloc] init];
//    [inputDone addTarget:self action:@selector(inputDown:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _messageText.inputAccessoryView = toolbar;
    _couponCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 93, 180, 24)];
    _couponCountLabel.font = [UIFont systemFontOfSize:10];
    _couponBtn = [[UIButton alloc] initWithFrame:CGRectMake(226, 93, 64, 24)];
    [_couponBtn setTitleColor:DarkGreen forState:UIControlStateNormal];
    _couponBtn.font = [UIFont systemFontOfSize:10];
    _payTypeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 128, 300, 24)];
    _payTypeTitleLabel.font = [UIFont systemFontOfSize:12];
    _alipay = [[UIButton alloc] initWithFrame:CGRectMake(0, 152, 300, 40)];
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 200)];
    [footView setBackgroundColor:BackGray];
    UIView *sendView = [[UIView alloc] initWithFrame:CGRectMake(10, 2, 300, 190)];
    [sendView setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *subline1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 300, 1)];
    UILabel *subline2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 92, 300, 1)];
    UILabel *subline3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 118, 300, 10)];
    UILabel *subline4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 152, 300, 1)];
    subline1.backgroundColor = BackGray;
    subline2.backgroundColor = BackGray;
    subline3.backgroundColor = BackGray;
    subline4.backgroundColor = BackGray;
    [sendView addSubview:_orderShippingCostLabel];
    [sendView addSubview:_orderTotalLabel];
    [sendView addSubview:_orderDiscountTotalLabel];
    [sendView addSubview:subline1];
    [sendView addSubview:subline2];[sendView addSubview:subline3];[sendView addSubview:subline4];
    [sendView addSubview:_messageText];
    [sendView addSubview:_couponCountLabel];
    [sendView addSubview:_couponBtn];
    [sendView addSubview:_payTypeTitleLabel];
    [sendView addSubview:_alipay];
    
    
    [footView addSubview:sendView];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40 , 320, 40)];
    bottomView.backgroundColor = DarkGray;
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
    _requestModel.tag = 10001;
    [_requestModel postData];
    
    _updateRequestModel.delegate = self;
    _updateRequestModel.tag = 10002;
    
    
    // Do any additional setup after loading the view.
}


//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    //注册优惠券使用通知
//    
//  
//    
//}


//-(void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}

-(void)addressChange:(NSNotification *)noti
{
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[noti userInfo]];
    
    _updateRequestModel.address = [dic objectForKey:@"address"];
    _updateRequestModel.mobile = [dic objectForKey:@"tel"];
    _updateRequestModel.linkMan = [dic objectForKey:@"name"];
    _updateRequestModel.tag = 10003;
    [_updateRequestModel postData];
    
    _orderAddressLabel.text = [NSString stringWithFormat:@"收货地址：%@",[dic objectForKey:@"address"]];
    _orderTelLabel.text = [NSString stringWithFormat:@"联系电话：%@",[dic objectForKey:@"tel"]];
    _orderLinkManLabel.text  =  [NSString stringWithFormat:@"联系人：%@",[dic objectForKey:@"name"]];}

-(void)couponHasBeenUsed:(NSNotification *)noti
{
    
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[noti userInfo]];
    
//    _updateRequestModel.couponId = [dic objectForKey:@"couponId"];
//    [_updateRequestModel postData];
    _couponCountLabel.text = [NSString stringWithFormat:@"您将使用优惠券‘%@’",[dic objectForKey:@"title"]] ;
    NSLog(@"coupon use");
}


-(void)refillLayouts
{
    _orderTypeTitleLabel.text = @"订单类型";
    
    
    if ([_responseModel.hasdelivery isEqualToString:@"0"]) {
        //
        _takeoutBtn.hidden = YES;
        _inRestroomBtn.enabled = false;
        
        [_inRestroomBtn setImage:[UIImage imageNamed:@"到店用餐选中.png"] forState:UIControlStateNormal];
        [_inRestroomBtn setImage:[UIImage imageNamed:@"到店用餐选中.png"] forState:UIControlStateDisabled];
//        [_takeoutBtn setImage:[UIImage imageNamed:@"送餐上门未选中.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        _inRestroomBtn.enabled = true;
        if ([_responseModel.orderType isEqualToString:@"0"]) {
            
            // 0 外卖 ，1 到店
            [_inRestroomBtn setImage:[UIImage imageNamed:@"到店用餐未选中.png"] forState:UIControlStateNormal];
            [_takeoutBtn setImage:[UIImage imageNamed:@"送餐上门选中.png"] forState:UIControlStateNormal];
        }
        else
        {
            
            [_inRestroomBtn setImage:[UIImage imageNamed:@"到店用餐选中.png"] forState:UIControlStateNormal];
            [_takeoutBtn setImage:[UIImage imageNamed:@"送餐上门未选中.png"] forState:UIControlStateNormal];
        }
    }
    

    
    _dinnerTimeLabel.text = [NSString stringWithFormat:@"用餐时间：%@",_responseModel.orderTime];
    _orderInfoTitleLabel.text = @"收货信息";
    [_updateOrderInfoBtn setTitle:@"修改信息" forState:UIControlStateNormal];
    [_updateOrderInfoBtn addTarget:self action:@selector(updateAddressInfo) forControlEvents:UIControlEventTouchUpInside];
    _orderAddressLabel.text = [NSString stringWithFormat:@"收货地址：%@",_responseModel.address];
    _orderTelLabel.text = [NSString stringWithFormat:@"联系电话：%@",_responseModel.mobile];
    _orderLinkManLabel.text  =  [NSString stringWithFormat:@"联系人：%@",_responseModel.linkMan];
    
    _orderDetailTitleLabel.text = @"订单详情";
    
    [_orderTable reloadData];
    
    _orderShippingCostLabel.text = [NSString stringWithFormat:@"配送费：%@元，满60元免配送费",_responseModel.sendPrice];
    _orderTotalLabel.text = [NSString stringWithFormat:@"合计：￥%@",_responseModel.totalPrice];
    _orderDiscountTotalLabel.text =  [NSString stringWithFormat:@"￥%@",_responseModel.totalPrice];
    
    _messageText.text = _responseModel.cconttent;
    
    _couponCountLabel.text = [NSString stringWithFormat:@"优惠券：您还剩%@张优惠券", _responseModel.coupondId];
    [_couponBtn setTitle:@"选择" forState:UIControlStateNormal];
    [_couponBtn addTarget:self action:@selector(addCouponToOrder) forControlEvents:UIControlEventTouchUpInside];
    _payTypeTitleLabel.text = @"付款方式";
//    _alipay.backgroundColor = [UIColor greenColor];
    
    [_alipay setTitle:@"支付宝" forState:UIControlStateNormal];
    [_alipay setTitleColor:DarkGreen forState:UIControlStateNormal];
    
    
    _totalPayLabel.text = [NSString stringWithFormat:@"应付总额：￥%@",_responseModel.totalPrice];
    _totalPayLabel.font = [UIFont systemFontOfSize:16];
    _getIntegrationLabel.text = [NSString stringWithFormat:@"可获积分：%@",_responseModel.extCredit];
    _getIntegrationLabel.font = [UIFont systemFontOfSize:12];
    
}

-(void)updateAddressInfo
{
    AddressViewController2 *addressVC = [[AddressViewController2 alloc] initWithTitle:@"修改地址" uid:[CoreHelper getLoginUid]];
    addressVC.addrTf.text = _responseModel.address;
    addressVC.telTf.text = _responseModel.mobile;
    addressVC.nameTf.text = _responseModel.linkMan;
    
    [self presentViewController:addressVC animated:YES completion:nil];
}

-(void)addCouponToOrder
{
    //
    UserCouponViewController *userCouponVC = [[UserCouponViewController alloc] initWithTitle:@"选择优惠券" ];
    userCouponVC.uoRequestModel = _updateRequestModel;
    [self presentViewController:userCouponVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestFailed:(NSString *)errorStr
{
    [SVProgressHUD showSuccessWithStatus_custom:errorStr duration:1.2];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            _responseModel = (OrderDetailResponseModel  *)model;
            [self refillLayouts];
            [self preSetUpdateArgs];
        }
            break;
        case 10002:
        {
            if (model.ResponseStatus == 1) {
                [SVProgressHUD showSuccessWithStatus_custom:@"订单信息已更新" duration:1.6];
                
//                NSLog(@"订单信息更新成功");
            }
            else
            {
               
            }
        }
            break;
        case 10003:
        {
            if (model.ResponseStatus == 1) {
                [SVProgressHUD showSuccessWithStatus_custom:@"地址已更新" duration:1.6];
                
                //                NSLog(@"订单信息更新成功");
            }
            else
            {
                
            }
        }
            break;
        case 10004:
        {
            if (model.ResponseStatus == 1) {
                [SVProgressHUD showSuccessWithStatus_custom:@"订单信息已更新" duration:1.6];
                
                //                NSLog(@"订单信息更新成功");
            }
            else
            {
                
            }
        }
            break;
        case 10005:
        {
            if (model.ResponseStatus == 1) {
                [SVProgressHUD showSuccessWithStatus_custom:@"订单信息已更新" duration:1.6];
                
                //                NSLog(@"订单信息更新成功");
            }
            else
            {
                [SVProgressHUD showSuccessWithStatus_custom:model.ErrMessage duration:1.6];
            }
        }
            break;
            
        default:
            break;
    }
}

-(void)preSetUpdateArgs
{
    _updateRequestModel.orderTime = _responseModel.orderTime;
    _updateRequestModel.orderPeople = _responseModel.orderPeople;
    _updateRequestModel.orderType = _responseModel.orderType;
    _updateRequestModel.couponId = _responseModel.coupondId;
    _updateRequestModel.address = _responseModel.address;
    _updateRequestModel.linkMan = _responseModel.linkMan;
    _updateRequestModel.mobile = _responseModel.mobile;
    _updateRequestModel.pid = @"2";
    _updateRequestModel.remark = _responseModel.remark;
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
    return 91.0;
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



////支付宝

-(void)payForOrder
{
    NSString *appScheme = @"mt2014";
    NSString* orderInfo = [self getOrderInfo];
    NSString* signedStr = [self doRsa:orderInfo];
    
    NSString *orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                             orderInfo, signedStr, @"RSA"];
	
    [AlixLibService payOrder:orderString AndScheme:appScheme seletor:@selector(paymentResult:) target:self];
    
}


-(NSString*)getOrderInfo
{
    /*
	 *点击获取prodcut实例并初始化订单信息
	 */
    //	Product *product = [_products objectAtIndex:index];
    AlixPayOrder *order = [[AlixPayOrder alloc] init];
    order.partner = PartnerID;
    order.seller = CustomID;
    
    order.tradeNO = _orderId;
	order.productName = @"福建省商友网络科技有限公司"; //商品标题
	order.productDescription = @"欢迎使用本软件购物"; //商品描述
        
    order.amount = [NSString stringWithFormat:@"%.2f",0.01];  //[[_dicdata valueForKey:@"total_fee"] floatValue]
	order.notifyURL =  @"http://www.mto2o.cn/bg/view/alipay/notify_ordersurl.aspx"; //回调URL
    //    order.notifyURL = @"http://www.niuhome.com/AlipayReturn";
	
	return [order description];
}


-(NSString*)doRsa:(NSString*)orderInfo
{
    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    
    NSString *signedString = [signer signString:orderInfo];
    
    return signedString;
}

-(void)paymentResultDelegate:(NSString *)result
{
    NSLog(@" payment result %@",result);
}


//wap回调函数
-(void)paymentResult:(NSString *)resultd
{
    
    AlixPayResult* result = [[AlixPayResult alloc] initWithString:resultd];
	if (result)
    {
		
		if (result.statusCode == 9000)
        {
			/*
			 *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
			 */
            
            //交易成功
            NSString* key = AlipayPubKey;//签约帐户后获取到的支付宝公钥
			id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(key);
            
			if ([verifier verifyString:result.resultString withSign:result.signString])
            {
                //验证签名成功，交易结果无篡改
                
                
                [self dismissViewControllerAnimated:YES completion:^{
                    
                    [SVProgressHUD showSuccessWithStatus_custom:@"支付成功" duration:1.2];
                }];
                
                
                
//                [self pres]
                
                
                NSLog(@"hehe success  %@",self.view);
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"kPaySuccess" object:nil];
			}
        }
        else
        {
            //交易失败
        }
    }
    else
    {
        //失败
    }
}


//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
	// get a rect for the textView frame
//	CGRect containerFrame = _orderTable.frame;
//    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	
	// set views with new info
//	_orderTable.frame = containerFrame;
	_orderTable.frame = CGRectMake(0, 64, 320, self.view.frame.size.height - 104 - keyboardBounds.size.height + 49);
    _orderTable.contentOffset = CGPointMake(0, keyboardBounds.size.height);
	// commit animations
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
	
	// get a rect for the textView frame
//	CGRect containerFrame = _orderTable.frame;
//    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
	// set views with new info
//	_containerView.frame = containerFrame;
	_orderTable.frame = CGRectMake(0, 64, 320, self.view.frame.size.height - 104);
    _orderTable.contentOffset = CGPointMake(0,0);
	// commit animations
	[UIView commitAnimations];
}


-(void)inputDown:(id)sender
{
    [_messageText resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

-(void)updateDescription
{
    if ([_messageText.text length]> 0) {
        
        _updateRequestModel.remark  = _messageText.text;
        _updateRequestModel.tag = 10004;
        [_updateRequestModel postData];
    }
    
}


-(void)takeOutBtnClcik:(id)sender
{
    
    // 0 外卖 ，1 到店
    if ([_updateRequestModel.orderType isEqualToString:@"1"]) {
        
        [self updateOrderType:@"0"];
        
        
        [_inRestroomBtn setImage:[UIImage imageNamed:@"到店用餐未选中.png"] forState:UIControlStateNormal];
        [_takeoutBtn setImage:[UIImage imageNamed:@"送餐上门选中.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        
    }
}

-(void)inRestroomBtnClick:(id)sender
{
    if (![_updateRequestModel.orderType isEqualToString:@"1"]) {
        [self updateOrderType:@"1"];
        
        [_inRestroomBtn setImage:[UIImage imageNamed:@"到店用餐选中.png"] forState:UIControlStateNormal];
        [_takeoutBtn setImage:[UIImage imageNamed:@"送餐上门未选中.png"] forState:UIControlStateNormal];
    }
    else
    {
        
    }
}



-(void)updateOrderType:(NSString *)type
{
    _updateRequestModel.orderType = type;
    _updateRequestModel.tag = 10005;
    [_updateRequestModel postData];
    
}

-(void)selectRightAction:(id)sender
{
    [CoreHelper callService:[CoreHelper getSellerPhone]];
}


-(void)paySuccess
{    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [SVProgressHUD showSuccessWithStatus_custom:@"支付成功" duration:1.2];
    }];
}

@end
