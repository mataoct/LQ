//
//  CouponViewController.m
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponViewController.h"

@interface CouponViewController ()

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
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 36)];
        
        
//        headView.backgroundColor  = BackGray;
        
        UILabel *integrationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 26)];
        integrationLabel.backgroundColor = [UIColor whiteColor];
        integrationLabel.textAlignment = NSTextAlignmentCenter;
        _integralValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 210, 26)];
        _integralValueLabel.backgroundColor = [UIColor whiteColor];
        integrationLabel.text = @"可用积分：";
        integrationLabel.font = [UIFont systemFontOfSize:16];_integralValueLabel.font = [UIFont systemFontOfSize:16];
        [headView addSubview:integrationLabel];
        [headView addSubview:_integralValueLabel];
        
        _couponTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64)];
        _couponTable.tableHeaderView = headView;
        
        _couponTable.dataSource = self;
        _couponTable.delegate = self;
        [self.view addSubview:_couponTable];
        
        
        _model = [[CouponRequestModel alloc] initWithSeller:@"100" Start:@"0" Limit:@"10"];
        _model.delegate = self;
        [_model postData];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    DiscountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DiscountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_responseModel.couponArr objectAtIndex:indexPath.row]];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_responseModel.couponArr count]?[_responseModel.couponArr count]:0;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CouponDetailViewController *detailVC = [[CouponDetailViewController alloc] initWithTitle:@"活动详情" andModel:[_responseModel.couponArr objectAtIndex:indexPath.row]];
    
    [self presentViewController:detailVC animated:YES completion:nil];

}


-(void)requestFailed
{
    
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (CouponResponseModel *)model;
    [self reLayoutViews];
}

-(void)reLayoutViews
{
    
    NSLog(@"relayouts");
    
    [_couponTable reloadData];
    _integralValueLabel.text = @"20";
}


@end
