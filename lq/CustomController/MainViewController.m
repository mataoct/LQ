//
//  MainViewController.m
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageView+WebCache.h"

@interface MainViewController ()

@end

@implementation MainViewController



-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



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
    
    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"GO" style:UIBarButtonItemStyleDone target:self action:@selector(gotoNavi)];
//    
//    [self.item setRightBarButtonItem:rightItem];
    
    
    _requestModel = [[MainPageBaseRequestModel alloc] initWithSellId:@"100"];
    _mainResponseModel = [[MainResponseModel alloc] init];
    _requestModel.delegate = self;
    [_requestModel postData];
    
    _menuList = [[MenuItemView alloc] initWithFrame:CGRectMake(0, 234, 320,self.view.frame.size.height- 20 -44 - 47 - 100 -70 -10)];
    
    
    [self.view addSubview:_menuList];
    
    
    [self setBackButtonHide:YES];

    // Do any additional setup after loading the view.
}


-(void)reFillLayouts
{
    
//
    
//    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
//    
//    for (SliderModel *tempSlider in _mainResponseModel.sliderArr) {
//        [tempArr addObject:tempSlider.img];
//    }
    
    [self setScroller:_mainResponseModel.sliderArr];
    
    [self setMenu];
    [_menuList setDataSource:_mainResponseModel.hotArr];
    _menuList.menuDelegate = self;
}


-(void)setScroller:(NSArray *)arr
{
    NSMutableArray *viewsArray = [@[] mutableCopy];
//    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < [arr count]; ++i) {
        UIImageView *tempLabel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
        
        tempLabel.userInteractionEnabled = YES;
        
        SliderModel *tempSlider = [[SliderModel alloc] init];
        tempSlider = [arr objectAtIndex:i];

        
        NSURL *url = [[NSURL alloc] initWithString:tempSlider.img];

        [tempLabel setImageWithURL:url placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
//        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempLabel];
    }
    
    _headView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 65, 320, 70) animationDuration:3];
    _headView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    
    _headView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    
    _headView.totalPagesCount = ^NSInteger(void){
        return [arr count];
    };
    _headView.TapActionBlock = ^(NSInteger pageIndex){
        
        SliderModel *tempSlider = [[SliderModel alloc] init];
        tempSlider = [arr objectAtIndex:pageIndex];
        
        NSLog(@"点击了第%d个,%@",pageIndex,tempSlider.type);
        
        
    };
    [self.view addSubview:_headView];
    
    
}

-(void)setMenu
{
    UIButton *fastOrder = [[UIButton alloc] initWithFrame:CGRectMake(0, 140, 80, 36)];
    UIButton *picWall = [[UIButton alloc] initWithFrame:CGRectMake(80, 140, 80, 36)];
    UIButton *myFav = [[UIButton alloc] initWithFrame:CGRectMake(160, 140, 80, 36)];
    UIButton *discount = [[UIButton alloc] initWithFrame:CGRectMake(240, 140, 80, 36)];
    
    fastOrder.backgroundColor    = [UIColor lightGrayColor];
    
    
    [fastOrder setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [picWall setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [myFav setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [discount setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    
    [fastOrder setTitle:@"快速预约" forState:UIControlStateNormal];
    [picWall setTitle:@"图片墙" forState:UIControlStateNormal];
    [myFav setTitle:@"我的收藏" forState:UIControlStateNormal];
    [discount setTitle:@"优惠券" forState:UIControlStateNormal];
    
    
    [discount addTarget:self action:@selector(jumpToDiscountTable) forControlEvents:UIControlEventTouchUpInside];
//    [discount addTarget:self action:@selector(jumpToDiscountTable) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:fastOrder];
    [self.view addSubview:picWall];
    [self.view addSubview:myFav];
    [self.view addSubview:discount];
    
    
    UIImageView *adView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180, 320, 36)];
//    adView.backgroundColor = [UIColor lightGrayColor];
    
    [adView setImageWithURL:_mainResponseModel.admodel.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    
    
    adView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *imageTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adTouch:)];
    
    [adView addGestureRecognizer:imageTouch];
    
    
    
    [self.view addSubview:adView];
    
}


-(void)menuItemClick:(NSInteger)tag
{
    NSLog(@"click tag %d",tag);
}

-(void)adTouch:(UIGestureRecognizer *)gesture
{
    NSLog(@"ad to %@",_mainResponseModel.admodel.url);
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

-(void)jumpToDiscountTable
{
//    DiscountTableViewController *discountTable = [[DiscountTableViewController alloc] initWithStyle:UITableViewStylePlain withDic:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil]];
//    
//    [self.navigationController pushViewController:discountTable animated:YES];
    
    
    NSLog(@"%@",self.navigationController);
    
    CouponViewController *couponVC = [[CouponViewController alloc] initWithTitle:@"电子优惠券"];
    [self.navigationController presentViewController:couponVC animated:YES completion:nil];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    // Do something with the downloaded image
}



-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _mainResponseModel = (MainResponseModel *)model;
    NSLog(@"model %@",_mainResponseModel.sliderArr);
    [self reFillLayouts];
}

@end
