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

@property (nonatomic,strong) NSMutableArray *checkArr;

@property (nonatomic,strong) UIBarButtonItem * rightButton;

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
        _checkArr = [[NSMutableArray alloc] init];
        self.view.backgroundColor = BackGray;
        _start = 0;
        _requestModel = [[MyCommentRequestModel alloc] initWithSeller:@"100" uid:[CoreHelper getLoginUid] start:[NSString stringWithFormat:@"%d",_start] limit:@"10" type:@"0"];
        _responseModel = [[MyCommentResponseModel alloc] init];
        
        
        _delRequestModel = [[DelCartRequestModel alloc] init];
        _delRequestModel.delegate = self;
        _delRequestModel.uid = [CoreHelper getLoginUid];
        _delRequestModel.sellerId = @"100";
        
        _commentTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 110, 300, self.view.frame.size.height - 110) style:UITableViewStylePlain];
        
        
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
        
        [self addHeader];
        
        _requestModel.delegate = self;
        _requestModel.tag = 10001;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(selectRightAction:)];
    _rightButton.image = [UIImage imageNamed:@"删除.png"];
    _rightButton.tintColor = [UIColor whiteColor];
    self.item.rightBarButtonItem = _rightButton;
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
    cell.delegate = self;
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
    [_commentTable headerEndRefreshing];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    switch (model.ResponseTag) {
        case 10001:
        {
            _responseModel = (MyCommentResponseModel *)model;
            
            
            if ([_responseModel.myCommArr count] > 0) {
                _start = _start +10;
                for (id model in _responseModel.myCommArr) {
                    [_sourceArr addObject:model];
                }
            }
            [_commentTable headerEndRefreshing];
            [_commentTable reloadData];
        }
            break;
        case 10002:
            
            _start = 0;
            _requestModel.start = [NSString stringWithFormat:@"%d",_start];
            [_sourceArr removeAllObjects];
            [_checkArr removeAllObjects];
            [_requestModel postData];
            [SVProgressHUD showErrorWithStatus_custom:@"删除成功" duration:1.2];
            break;
        default:
            break;
    }
    
    

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
    [_checkArr removeAllObjects];
    
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

- (void)addHeader
{
    __unsafe_unretained typeof(self) wself = self;
    // 添加下拉刷新头部控件
    [_commentTable addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        wself.requestModel.start = [NSString stringWithFormat:@"%d",wself.start];
        [wself.requestModel postData];
    }];
}

-(void)commentBtnClick:(MyCommentModel *)model checkStatus:(NSInteger)status
{
    if (status == 0) {
        //消除选择
        [_checkArr removeObject:model];
    }
    else
    {
        [_checkArr addObject:model];
    }
    
    NSLog(@"check arr is %@",_checkArr);
}

-(void)selectRightAction:(id)sender
{
    if([_checkArr count] > 0)
    {

            MyCommentModel *temp = [[MyCommentModel alloc] init];

            for (int i = 0; i < [_checkArr count]; i ++) {
                temp = [_sourceArr objectAtIndex:i];
                
                
                if (i == 0) {
                    _delRequestModel.gid = temp.commentId;
                }
                else
                {
                    _delRequestModel.gid = [_delRequestModel.gid stringByAppendingFormat:@",%@",temp.commentId];
                }
            }
            _delRequestModel.delegate = self;
            _delRequestModel.tag = 10002;
            [_delRequestModel deleteComment];
//
//        }
//    
    }
}



@end
