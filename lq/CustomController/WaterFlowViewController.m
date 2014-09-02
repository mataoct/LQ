//
//  WaterFlowViewController.m
//  lq
//
//  Created by 马涛 on 14-8-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WaterFlowViewController.h"

@interface WaterFlowViewController ()

@end

@implementation WaterFlowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString *)str sellerid:(NSString *)sellerid start:(NSString *)start limit:(NSString *)limit
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        _sellerId = [[NSString alloc] init];
        _start = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        
        
        
        _start = start;
        _sellerId = sellerid;
        _limit = limit;
        
        
        _requestModel = [[WatetFlowRequestModel alloc] initWithSellerid:_sellerId start:_start limit:_limit];
        _responseModel = [[WaterFlowResponseModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _waterFlow = [[WaterFlowView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 66)];
    _waterFlow.waterFlowViewDatasource = self;
    _waterFlow.waterFlowViewDelegate = self;
    _waterFlow.backgroundColor = BackGray;
    [self.view addSubview:_waterFlow];
    
    [self loadInternetData];
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


- (void)loadInternetData {
    // Request
    
    _requestModel.delegate = self;
    [_requestModel postData];
    
    
}

- (void)dataSourceDidLoad {
    [_waterFlow reloadData];
}

- (void)dataSourceDidError {
    [_waterFlow reloadData];
}


-(void)loadMore{
    
    [_arrayData addObjectsFromArray:_arrayData];
    [_waterFlow reloadData];
}

#pragma mark WaterFlowViewDataSource
- (NSInteger)numberOfColumsInWaterFlowView:(WaterFlowView *)waterFlowView{
    
    return 2;
}

- (NSInteger)numberOfAllWaterFlowView:(WaterFlowView *)waterFlowView{
    
    
    
    return [_arrayData count];
}

- (UIView *)waterFlowView:(WaterFlowView *)waterFlowView cellForRowAtIndexPath:(IndexPath *)indexPath{
    
    ImageViewCell *view = [[ImageViewCell alloc] initWithIdentifier:nil];
    
    return view;
}


-(void)waterFlowView:(WaterFlowView *)waterFlowView  relayoutCellSubview:(UIView *)view withIndexPath:(IndexPath *)indexPath{
    
    //arrIndex是某个数据在总数组中的索引
    int arrIndex = indexPath.row * waterFlowView.columnCount + indexPath.column;
    
    
    WaterFlowModel  *object = [_arrayData objectAtIndex:arrIndex];
    
//    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://imgur.com/%@%@", [object objectForKey:@"hash"], [object objectForKey:@"ext"]]];
    
    ImageViewCell *imageViewCell = (ImageViewCell *)view;
    imageViewCell.indexPath = indexPath;
    imageViewCell.columnCount = waterFlowView.columnCount;
    [imageViewCell relayoutViews];
    [(ImageViewCell *)view setImageWithURL:object.img];
}


#pragma mark WaterFlowViewDelegate
- (CGFloat)waterFlowView:(WaterFlowView *)waterFlowView heightForRowAtIndexPath:(IndexPath *)indexPath{
    
//    int arrIndex = indexPath.row * waterFlowView.columnCount + indexPath.column;
    
    float width = 160.0f;
    float height = 160.0f;
    
    return waterFlowView.cellWidth * (height/width);
}

- (void)waterFlowView:(WaterFlowView *)waterFlowView didSelectRowAtIndexPath:(IndexPath *)indexPath{
    
    int arrIndex = indexPath.row * waterFlowView.columnCount + indexPath.column;
    
    
    WaterFlowModel  *object = [_arrayData objectAtIndex:arrIndex];
    
    WaterDetailViewController *waterVC = [[WaterDetailViewController alloc] initWithTitle:@"图片墙详情" andPid:object.pid];
    
    [self presentViewController:waterVC animated:YES completion:nil];
}


-(void)requestFailed:(NSString *)errorStr
{
        NSLog(@"water flow failed %@",errorStr);
    [self dataSourceDidError];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    NSLog(@"water flow success");
//    _arrayData =
    
    _responseModel = (WaterFlowResponseModel *)model;
    
    _arrayData = _responseModel.waterArr;
    
    [self dataSourceDidLoad];
}



@end
