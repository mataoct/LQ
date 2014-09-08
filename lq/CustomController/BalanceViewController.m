//
//  BalanceViewController.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BalanceViewController.h"

@interface BalanceViewController ()

@property (nonatomic,assign) NSInteger start;

@end

@implementation BalanceViewController

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
    
    _contentTable =  [[CYTableView alloc] initWithFrame:CGRectMake(10, 74, 300, self.view.frame.size.height - 74) style:UITableViewStylePlain];
    
    _contentTable.delegate = self;
    _contentTable.dataSource = self;
    _contentTable.backgroundColor = BackGray;
    _contentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentTable.showsHorizontalScrollIndicator = false;
    _start = 0;
    
    _contentTable.CYdelegate = self;
    [_contentTable setHeaderRefreshEnabled:YES];
    [_contentTable setFooterRefreshEnabled:YES];
    
    [self.view addSubview:_contentTable];
    
    _sourceArr = [[NSMutableArray alloc] init];
    
    _requestModel = [[CouponRequestModel alloc] initWithSeller:@"100" Start:[NSString stringWithFormat:@"%d",_start] Limit:@"10"];
    _requestModel.uid = [CoreHelper getLoginUid];
    
    _responseModel = [[BalanceResponseModel alloc] init];
    
    _requestModel.delegate = self;
    [_requestModel postBalance];
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
    [cell fillCellByBModel:[_sourceArr objectAtIndex:indexPath.row]];
    
    
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
    [integral setText:@"余额"];
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
    return [_sourceArr count];
}


-(void)requestFailed:(NSString *)errorStr
{
    [_contentTable endHearderRefreshing];
    _contentTable.headerRefreshing = false;
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (BalanceResponseModel *)model;
    
    if ([_responseModel.balanceArr count] > 0) {
        _start = _start + 10;
        
        
        for (id model in _responseModel.balanceArr) {
            [_sourceArr addObject:model];
        }
        
        [_contentTable reloadData];
    }
    
    
    [_contentTable endHearderRefreshing];
    _contentTable.headerRefreshing = false;
    

}




#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isKindOfClass:[CYTableView class]] && !_contentTable.headerRefreshing && !_contentTable.footerRefreshing)
    {
        [((CYTableView *)scrollView).hearderView egoRefreshScrollViewDidScroll:scrollView];
        [((CYTableView *)scrollView).footerView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
    if ([scrollView isKindOfClass:[CYTableView class]])
    {
            [((CYTableView *)scrollView).hearderView egoRefreshScrollViewDidEndDragging:scrollView];

            [((CYTableView *)scrollView).footerView egoRefreshScrollViewDidEndDragging:scrollView];

    }
}





#pragma mark -
#pragma mark CYTableViewDelegate

-(void)refreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    NSLog(@"loading header");
    
//    [self requestAll];
    
    _contentTable.headerRefreshing = YES;
    
    
    _requestModel.start = [NSString stringWithFormat:@"%d",_start + 10];
    [_requestModel postBalance];
    
//    [_contentTable setFooterRefreshEnabled:YES];
//    [_contentTable.tableFooterView removeFromSuperview];
    //    [_table endHearderRefreshing];
}

-(void)refreshTableFooterDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
//    [self requestForData: [NSString stringWithFormat:@"/mobilegame/news/newslist?page=%d&pagesize=10",_nextPage] withTag:REQUEST_MORENEWS];
    //    [_table endFooterRefreshing];
}

-(void)refreshTableFinish:(EGORefreshTableHeaderView *)view
{
    NSLog(@"finish");
}

@end
