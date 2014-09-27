//
//  MyCommentViewController.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyCommentViewController.h"

@interface MyCommentViewController ()

@property (nonatomic,assign) NSInteger start;

@end

@implementation MyCommentViewController

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
        
        
        _sourceArr = [[NSMutableArray alloc] init];
        
        self.view.backgroundColor = BackGray;
        _start = 0;
        _requestModel = [[MyCommentRequestModel alloc] initWithSeller:@"100" uid:[CoreHelper getLoginUid] start:[NSString stringWithFormat:@"%d",_start] limit:@"10" type:@"0"];
        _responseModel = [[MyCommentResponseModel alloc] init];
        
        _commentTable = [[CYTableView alloc] initWithFrame:CGRectMake(10, 110, 300, self.view.frame.size.height - 110) style:UITableViewStylePlain];
        
        
        NSArray *buttonNames = [NSArray arrayWithObjects:@"所有评论", @"商品评论", @"图片墙评论", nil];
        _seg = [[UISegmentedControl alloc] initWithItems:buttonNames];
        [_seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        [_seg setFrame:CGRectMake(10, 74, 300, 26)];
        [_seg setSelectedSegmentIndex:0];
        
        
//        _seg.segmentedControlStyle
        
        _seg.tintColor = DarkGreen;
        
        [self.view addSubview:_seg];
        [self.view addSubview:_commentTable];
        
        
        _commentTable.delegate = self;
        _commentTable.dataSource =self;
        _commentTable.backgroundColor = BackGray;
        _commentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _commentTable.CYdelegate = self;
            [_commentTable setHeaderRefreshEnabled:YES];
        
        _requestModel.delegate = self;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    _start = 0;
    [super viewDidAppear:animated];
    
    [_requestModel postData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    _start = 0;
    [super viewDidDisappear:animated];
    [_requestModel.request cancel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr count]?[_sourceArr count]:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Acell";
    MyCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_sourceArr objectAtIndex:indexPath.row]];
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
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

-(void)requestFailed:(NSString *)errorStr
{
    
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (MyCommentResponseModel *)model;
    
    
    
    if ([_responseModel.myCommArr count] > 0) {
        _start = _start +10;
        
        
        
        for (id model in _responseModel.myCommArr) {
            [_sourceArr addObject:model];
        }
        
        
        
        [_commentTable reloadData];
    }
    
    
    
    
    
    [_commentTable endHearderRefreshing];
    
}


-(void)allCommentClick
{
    [_requestModel.request cancel];
    _requestModel.type = @"0";
    _requestModel.start = [NSString stringWithFormat:@"%d",_start];
    [_requestModel postData];
}

-(void)goodCommentClick
{
    [_requestModel.request cancel];
    _requestModel.type = @"1";
    _requestModel.start = [NSString stringWithFormat:@"%d",_start];
    [_requestModel postData];
}

-(void)picCommentClick
{
    [_requestModel.request cancel];
    _requestModel.type = @"2";
    _requestModel.start = [NSString stringWithFormat:@"%d",_start];
    [_requestModel postData];
}


-(void)segmentAction:(UISegmentedControl *)seg{
//    NSInteger Index = seg.selectedSegmentIndex;
    
    _start = 0;
    [_sourceArr removeAllObjects];
    
    switch (seg.selectedSegmentIndex) {
        case 0:
            [self allCommentClick];
            break;
        case 1:
            [self goodCommentClick];
            break;
        case 2:
            [self picCommentClick];
            break;
            
        default:
            break;
    }
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isKindOfClass:[CYTableView class]] && !_commentTable.headerRefreshing && !_commentTable.footerRefreshing)
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
    
    _commentTable.headerRefreshing = YES;
    
    
    _requestModel.start = [NSString stringWithFormat:@"%d",_start + 10];
    
    
    
    
    
    
    
    [_requestModel postData];
    
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
