//
//  MyCommentViewController.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyCommentViewController.h"

@interface MyCommentViewController ()

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
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        _requestModel = [[MyCommentRequestModel alloc] initWithSeller:@"100" uid:@"3" start:@"0" limit:@"10" type:@"0"];
        _responseModel = [[MyCommentResponseModel alloc] init];
        
        _allCommnetBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 74, 100, 20)];
        _goodCommentBtn = [[UIButton alloc] initWithFrame:CGRectMake(110, 74, 100, 20)];
        _picCommentBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 74, 100, 20)];
        
        _commentTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 100, 300, self.view.frame.size.height - 100) style:UITableViewStylePlain];
        
        
        [self.view addSubview:_allCommnetBtn];
        [self.view addSubview:_goodCommentBtn];
        [self.view addSubview:_picCommentBtn];
        [self.view addSubview:_commentTable];
        
        
        [_allCommnetBtn  addTarget:self action:@selector(allCommentClick) forControlEvents:UIControlEventTouchUpInside];
        [_goodCommentBtn addTarget:self action:@selector(goodCommentClick) forControlEvents:UIControlEventTouchUpInside];
        [_picCommentBtn addTarget:self action:@selector(picCommentClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        _commentTable.delegate = self;
        _commentTable.dataSource =self;
        
        _requestModel.delegate = self;
        [_requestModel postData];
        
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_responseModel.myCommArr count]?[_responseModel.myCommArr count]:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    MyCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_responseModel.myCommArr objectAtIndex:indexPath.row]];
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0;
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

-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (MyCommentResponseModel *)model;
    [_commentTable reloadData];
}


-(void)allCommentClick
{
    _requestModel.type = @"0";
    [_requestModel postData];
}

-(void)goodCommentClick
{
    _requestModel.type = @"1";
    [_requestModel postData];
}

-(void)picCommentClick
{
    _requestModel.type = @"2";
    [_requestModel postData];
}

@end
