//
//  MainViewController.m
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController



-(id)init
{
    self = [super init];
    if (self) {
//        self.navigationController.navigationItem.title = @"首页";
        self.title = @"首页";
    
//        NSDictionary *dict=[NSDictionary dictionaryWithObjects:
//                            [NSArray arrayWithObjects:[UIColor whiteColor],[UIFont boldSystemFontOfSize:17],[UIColor clearColor],nil]
//                                                       forKeys:
//                            [NSArray arrayWithObjects:NSForegroundColorAttributeName,NSFontAttributeName,NSShadowAttributeName,nil]];
//        self.navigationController.navigationBar.titleTextAttributes=dict;
//
        
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
    
    
    _menuList = [[MenuItemView alloc] initWithFrame:CGRectMake(0, 290, 320,self.view.frame.size.height- 290 - 64 - 49)];
    _headView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 170) animationDuration:3];
    [self.view addSubview:_headView];
    
    [self.view addSubview:_menuList];
    
    
    _fastOrder = [[UIButton alloc] initWithFrame:CGRectMake(0, 170, 80, 80)];
    _picWall = [[UIButton alloc] initWithFrame:CGRectMake(80, 170, 80, 80)];
    _myFav = [[UIButton alloc] initWithFrame:CGRectMake(160, 170, 80, 80)];
    _discount = [[UIButton alloc] initWithFrame:CGRectMake(240, 170, 80, 80)];
    _adView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, 320, 40)];
    
    
    [self.view addSubview:_fastOrder];
    [self.view addSubview:_picWall];
    [self.view addSubview:_myFav];
    [self.view addSubview:_discount];
    [self.view addSubview:_adView];
    
    [self.view setBackgroundColor:BackGray];
    
    
//    [self setBackButtonHide:YES];

    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_requestModel postData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [_requestModel.request cancel];
}

-(void)reFillLayouts
{
    [self setScroller:_mainResponseModel.sliderArr];
    
    [self setMenu];
    [_menuList setDataSource:_mainResponseModel.hotArr];
    _menuList.menuDelegate = self;
}


-(void)setScroller:(NSArray *)arr
{
    NSMutableArray *viewsArray = [@[] mutableCopy];

    for (int i = 0; i < [arr count]; ++i) {
        UIImageView *tempLabel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 170)];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, 320, 30)];
        textLabel.alpha = 0.5;
        textLabel.backgroundColor = [UIColor grayColor];
    
        [tempLabel addSubview:textLabel];
        
        tempLabel.userInteractionEnabled = YES;
        
        SliderModel *tempSlider = [[SliderModel alloc] init];
        tempSlider = [arr objectAtIndex:i];
        textLabel.text = tempSlider.title;
        
        NSURL *url = [[NSURL alloc] initWithString:[tempSlider.img stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

        [tempLabel setImageWithURL:url placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
//        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempLabel];
    }
    

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
    
    
}

-(void)setMenu
{
    [_fastOrder setBackgroundImage:[UIImage imageNamed:@"首页_02.png"] forState:UIControlStateNormal];
    [_picWall setBackgroundImage:[UIImage imageNamed:@"首页_03.png"] forState:UIControlStateNormal];
    [_myFav setBackgroundImage:[UIImage imageNamed:@"首页_04.png"] forState:UIControlStateNormal];
    [_discount setBackgroundImage:[UIImage imageNamed:@"首页_05.png"] forState:UIControlStateNormal];
    
    [_fastOrder addTarget:self action:@selector(callSeller) forControlEvents:UIControlEventTouchUpInside];
    [_discount addTarget:self action:@selector(jumpToDiscountTable) forControlEvents:UIControlEventTouchUpInside];
    [_myFav addTarget:self action:@selector(jumpToMyFav) forControlEvents:UIControlEventTouchUpInside];
    [_picWall addTarget:self action:@selector(jumpToWaterFlow) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_adView setImageWithURL:_mainResponseModel.admodel.img placeholderImage:[UIImage imageNamed:@"图片默认2.png"] success:nil failure:nil];
    
    _adView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *imageTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adTouch:)];
    
    [_adView addGestureRecognizer:imageTouch];
    
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

-(void)jumpToWaterFlow
{
    WaterFlowViewController *waterVC = [[WaterFlowViewController alloc] initWithTitle:@"图片墙" sellerid:@"100" start:@"0" limit:@"10"];
    [self.navigationController presentViewController:waterVC animated:YES completion:nil];
}
-(void)jumpToMyFav
{
    if (![CoreHelper checkLogin])
    {
        LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
        [self.navigationController presentViewController:loginController animated:YES completion:nil];
    }
    else
    {
        MyFavViewController *favVC = [[MyFavViewController alloc] init];
        [favVC showBackButton];
        [self.navigationController pushViewController:favVC animated:YES];
    }
}

-(void)callSeller
{
    [CoreHelper callService:[CoreHelper getSellerPhone]];
}


- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    // Do something with the downloaded image
}



-(void)requestFailed:(NSString *)errorStr
{
    NSLog(@"main page error");
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _mainResponseModel = (MainResponseModel *)model;
    NSLog(@"model %@",_mainResponseModel.sliderArr);
    [self reFillLayouts];
}

@end
