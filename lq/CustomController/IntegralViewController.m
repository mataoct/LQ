//
//  IntegralViewController.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "IntegralViewController.h"

@interface IntegralViewController ()

@end

@implementation IntegralViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _contentTable =  [[UITableView alloc] initWithFrame:CGRectMake(10, 74, 300, self.view.frame.size.height - 74) style:UITableViewStylePlain];
    
    _contentTable.delegate = self;
    _contentTable.dataSource = self;
    _contentTable.backgroundColor = BackGray;
    _contentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentTable.showsHorizontalScrollIndicator = false;
    
    [self.view addSubview:_contentTable];
    
    _requestModel = [[CouponRequestModel alloc] initWithSeller:CustomID Start:@"0" Limit:@"10"];
    _requestModel.uid = [CoreHelper getLoginUid];
    
    _responseModel = [[IntegralResponseModel alloc] init];
    
    _requestModel.delegate = self;
    [_requestModel postIntegral];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32.0;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 32.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    IntegralTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[IntegralTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell fillCellByIModel:[_responseModel.integralArr objectAtIndex:indexPath.row]];
    
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 32)];
    [headSection setBackgroundColor:[UIColor grayColor]];
    UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 70, 32)];
    date.font = [UIFont systemFontOfSize:12];
    [date setText:@"日期"];
    UILabel *orderId = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 110, 32)];
    orderId.font = [UIFont systemFontOfSize:12];
    [orderId setText:@"订单号"];
    UILabel *integral = [[UILabel alloc] initWithFrame:CGRectMake(190, 0, 40, 32)];
    integral.font = [UIFont systemFontOfSize:12];
    [integral setText:@"积分"];
    UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(230, 0, 70, 32)];
    type.font = [UIFont systemFontOfSize:12];
    [type setText:@"类型"];
    
    [headSection addSubview:date];
    [headSection addSubview:orderId];
    [headSection addSubview:integral];
    [headSection addSubview:type];
    
    
    
    return headSection;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 10.0;
    return [_responseModel.integralArr count];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)requestFailed:(NSString *)errorStr
{
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.3];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (IntegralResponseModel *)model;
    [_contentTable reloadData];
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
