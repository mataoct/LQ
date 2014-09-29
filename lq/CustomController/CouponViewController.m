//
//  CouponViewController.m
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponViewController.h"

@interface CouponViewController ()

@property (nonatomic,assign) NSInteger start;
@property (nonatomic,strong) NSMutableArray *sourceArr;

@end

@implementation CouponViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithTitle:(NSString *)str
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 46)];
        
        _sourceArr = [[NSMutableArray alloc] init];
        
//        self.view.backgroundColor  = BackGray;
        
        UILabel *integrationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 85, 36)];
        integrationLabel.backgroundColor = [UIColor whiteColor];
        integrationLabel.textAlignment = NSTextAlignmentCenter;
        _integralValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 10, 210, 36)];
        _integralValueLabel.backgroundColor = [UIColor whiteColor];
        integrationLabel.text = @"可用积分：";
        integrationLabel.font = [UIFont systemFontOfSize:14];_integralValueLabel.font = [UIFont systemFontOfSize:16];
        _integralValueLabel.textColor = DarkGreen;
        [headView addSubview:integrationLabel];
        [headView addSubview:_integralValueLabel];
        
        _couponTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64)];
        _couponTable.tableHeaderView = headView;
        _couponTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _couponTable.backgroundColor = BackGray;
        _couponTable.dataSource = self;
        _couponTable.delegate = self;
        [self addFooter];
        [self.view addSubview:_couponTable];
        
        
        
        _model = [[CouponRequestModel alloc] initWithSeller:@"100" Start:[NSString stringWithFormat:@"%d",_start] Limit:@"10"];
        _model.delegate = self;
        _model.tag = 10001;
        
        _requestModel = [[UserInfoRequestModel alloc] initWithSellId:@"100" uid:[CoreHelper getLoginUid]];
        _requestModel.delegate = self;
        _requestModel.tag = 10002;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn. frame=CGRectMake(15, 5, 23, 23);
    [btn setBackgroundImage:[UIImage imageNamed:@"标题--电话.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selectRightAction:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *call=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    self.item.rightBarButtonItem = call;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _start = 0;
    _model.start = [NSString stringWithFormat:@"%d",_start];
    [_model postData];
    [_requestModel postData];
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kIntegralChange" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(integralChange:) name:@"kIntegralChange" object:nil];
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    DiscountTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DiscountTableViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_sourceArr objectAtIndex:indexPath.row]];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr count];
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CouponDetailViewController *detailVC = [[CouponDetailViewController alloc] initWithTitle:@"优惠券详情" andModel:[_sourceArr objectAtIndex:indexPath.row]];
    
    [self presentViewController:detailVC animated:YES completion:nil];

}

-(void)requestFailed:(NSString *)errorStr
{
                [_couponTable footerEndRefreshing];
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.2];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            _responseModel = (CouponResponseModel *)model;
            
            if ([_responseModel.couponArr count] > 0) {
                for (id model in _responseModel.couponArr) {
                    [_sourceArr addObject:model];
                }
                
                _start++;
            }
            
            [self reLayoutViews];
            [_couponTable footerEndRefreshing];
        }
            break;
        case 10002:
        {
            _userInfoResponseModel = (AnotherUserInfoResponseModel *)model;
            [self updateIntegral:_userInfoResponseModel.integral];
        }
            break;
        default:
            break;
    }
}

-(void)reLayoutViews
{
    
    NSLog(@"relayouts");
    
    [_couponTable reloadData];
}


//-(void)integralChange:(NSNotification *)noti
//{
//    
//    
//    NSLog(@"noti is %@",[noti userInfo]);
//}

-(void)updateIntegral:(NSString *)integral
{
    _integralValueLabel.text = integral ;
}


- (void)addFooter
{
    __unsafe_unretained typeof(self) wself = self;
    // 添加下拉刷新头部控件
    [_couponTable addFooterWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        wself.model.start = [NSString stringWithFormat:@"%d",wself.start];
        [wself.model postData];
    }];
}


-(void)selectRightAction:(id)sender
{
    [CoreHelper callService:[CoreHelper getSellerPhone]];
    NSLog(@"call");
}
@end
