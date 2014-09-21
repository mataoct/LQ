//
//  InfoViewController.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@property (nonatomic,assign) NSInteger start;

@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidAppear:(BOOL)animated
{
    [_sourceArr removeAllObjects];
    
    _start = 0;
    _model.start = 0;
    
    [_model postData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [_model.request cancel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.view setBackgroundColor:BackGray];
    
    _sourceArr = [[NSMutableArray alloc] init];
    _start = 0;
    _model = [[InfoRequestModel alloc] initWithSeller:@"100" Start:[NSString stringWithFormat:@"%d",_start] Limit:@"10"];
    _infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 64 - 49 ) style:UITableViewStylePlain];
    _infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _infoTable.backgroundColor = BackGray;
    _infoTable.showsVerticalScrollIndicator = false;
    _responseModel = [[InfoResponseModel alloc] init];
    
    
    [self.view addSubview:_infoTable];
    
    _infoTable.delegate = self;
    _infoTable.dataSource = self;
    _model.delegate = self;
    
    [self addHeader];
    
    
    // Do any additional setup after loading the view.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[InfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    [cell fillCellByModel:[_sourceArr objectAtIndex:indexPath.row] ];
    
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoDetailViewController *detailVC = [[InfoDetailViewController alloc] initWithModel:[_sourceArr objectAtIndex:indexPath.row]];
    
    [detailVC showBackButton];
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestFailed:(NSString *)errorStr
{
        [_infoTable headerEndRefreshing];
    
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.5 ];
    
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (InfoResponseModel *)model;
    
    
    if ([_responseModel.infoArr count] > 0) {
        for (id temp in _responseModel.infoArr) {
            //
            [_sourceArr addObject:temp];
        }
        
        _start++;
    }
    
    
    [_infoTable headerEndRefreshing];
    
    [_infoTable reloadData];
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


- (void)addHeader
{
    __unsafe_unretained typeof(self) wself = self;
    // 添加下拉刷新头部控件
    [_infoTable addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        wself.model.start = [NSString stringWithFormat:@"%d",wself.start];
        [wself.model postData];
    }];
}

- (void)addFooter
{
    //    __unsafe_unretained typeof(self) vc = self;
    // 添加上拉刷新尾部控件
    [_infoTable addFooterWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
    }];
}

@end
