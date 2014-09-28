//
//  Water2ViewController.m
//  lq
//
//  Created by  matao on 14-9-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

NSString *const MJCollectionViewCellIdentifier = @"Cell";

#import "Water2ViewController.h"

@interface Water2ViewController ()



@end

@implementation Water2ViewController

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
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(145, 145);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 66) collectionViewLayout:layout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = BackGray;
//    _collectionView.
    
    
    UINib *nib = [UINib nibWithNibName:@"CollectionCell"
                                bundle: [NSBundle mainBundle]];
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MJCollectionViewCellIdentifier];
    
    [_collectionView registerNib:nib forCellWithReuseIdentifier:MJCollectionViewCellIdentifier];
    
    [self.view addSubview:_collectionView];
    
//    [self addFooter];
    [self addHeader];
    
    _start = 0;
    
    _requestModel.delegate = self;
    [_requestModel postData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    

    
}

-(id)initWithTitle:(NSString *)str sellerid:(NSString *)sellerid start:(NSString *)start limit:(NSString *)limit
{
    self = [super initWithTitle:str];
    if (self) {
        //
        _sellerId = [[NSString alloc] init];
        _limit = [[NSString alloc] init];
        
        _start = [start integerValue];
        _sellerId = sellerid;
        _limit = limit;
        
        _requestModel = [[WatetFlowRequestModel alloc] initWithSellerid:_sellerId start:start limit:_limit];
        _responseModel = [[WaterFlowResponseModel alloc] init];
        
        
        _sourceArr = [[NSMutableArray alloc] init];
        _arrayData = [[NSMutableArray alloc] init];
        
    }
    return self;
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

/**
 *  初始化collectionView
 */
//- (void)setupCollectionView
//{
//    _collectionView.backgroundColor = [UIColor whiteColor];
//    _collectionView.alwaysBounceVertical = YES;
//    [_collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:MJCollectionViewCellIdentifier];
//}

- (void)addHeader
{
    __unsafe_unretained typeof(self) wself = self;
    // 添加下拉刷新头部控件
    [self.collectionView addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block

        wself.requestModel.start = [NSString stringWithFormat:@"%d",wself.start];
        
        [wself.requestModel postData];
    }];
}

- (void)addFooter
{
//    __unsafe_unretained typeof(self) vc = self;
    // 添加上拉刷新尾部控件
    [self.collectionView addFooterWithCallback:^{
        // 进入刷新状态就会回调这个Block

    }];
}



#pragma mark - collection数据源代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.fakeColors.count;
    return [_sourceArr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WaterFlowModel  *object = [_sourceArr objectAtIndex:indexPath.row];
    
    
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCollectionViewCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CollectionCell alloc] initWithFrame:CGRectMake(0, 0, 145, 145)];
    }
    [cell fillCellWithModel:object];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"heheheh");
    
    WaterFlowModel  *object = [_sourceArr objectAtIndex:indexPath.row];
    
    WaterDetailViewController *waterVC = [[WaterDetailViewController alloc] initWithTitle:@"图片墙详情" andPid:object.pid];
    
    [self presentViewController:waterVC animated:YES completion:nil];
}




-(void)requestFailed:(NSString *)errorStr
{
    [_collectionView headerEndRefreshing];
    NSLog(@"water flow failed %@",errorStr);
//    [_collectionView reloadData];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    [_collectionView headerEndRefreshing];
    
    NSLog(@"water flow success");
    _responseModel = (WaterFlowResponseModel *)model;
    _arrayData = _responseModel.waterArr;
    
    if ([_arrayData count] > 0) {
        for (id model in _arrayData) {
            [_sourceArr addObject:model];
        }
        _start ++;
    }
    
    [_collectionView reloadData];
}



@end
