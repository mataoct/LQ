//
//  MainViewController.m
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic,strong) UIScrollView *subScorller;

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
    
    _subScorller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_subScorller setContentSize:CGSizeMake(self.view.frame.size.width, 576)];
    
    _requestModel = [[MainPageBaseRequestModel alloc] initWithSellId:CustomID];
    _mainResponseModel = [[MainResponseModel alloc] init];
    _requestModel.delegate = self;
    
    
//    _menuList = [[MenuItemView alloc] initWithFrame:CGRectMake(0, 290, 320,self.view.frame.size.height- 290 - 64 - 49)];
    _headView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 250) animationDuration:3];
    [_subScorller addSubview:_headView];
    
//    [_subScorller addSubview:_menuList];
    
    
    _fastOrder = [[UIButton alloc] initWithFrame:CGRectMake(200, 260, 110, 175)];
    _picWall = [[UIButton alloc] initWithFrame:CGRectMake(10, 350, 90, 85)];
    _myFav = [[UIButton alloc] initWithFrame:CGRectMake(10, 260, 185, 85)];
    _discount = [[UIButton alloc] initWithFrame:CGRectMake(105, 350, 90, 85)];
    
    _fastOrder.backgroundColor = [UIColor blueColor];
    _picWall.backgroundColor = [UIColor brownColor];
    _myFav.backgroundColor = [UIColor redColor];
    _discount.backgroundColor = [UIColor orangeColor];
//    _adView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, 320, 40)];
    
    
    [_subScorller addSubview:_fastOrder];
    [_subScorller addSubview:_picWall];
    [_subScorller addSubview:_myFav];
    [_subScorller addSubview:_discount];
//    [_subScorller addSubview:_adView];
    
    [_subScorller setBackgroundColor:BackGray];
    
    [self.view addSubview:_subScorller];
    
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
    if ([_mainResponseModel.sliderArr count] > 0) {
        
        [self setScroller:_mainResponseModel.sliderArr];
    }
    
    [self setMenu];
//    [_menuList setDataSource:_mainResponseModel.hotArr];
//    _menuList.menuDelegate = self;
    
    
//    [_subScorller setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    
//    [_subScorller setContentSize:CGSizeMake(320, self.view.frame.size.height > _menuList.frame.origin.y + _menuList.frame.size.height ? self.view.frame.size.height : _menuList.frame.origin.y + _menuList.frame.size.height )];
}


-(void)setScroller:(NSMutableArray *)arr
{
    
    if ([arr count] == 1) {
        [arr addObject:[arr objectAtIndex:0]];
        [arr addObject:[arr objectAtIndex:0]];
    }
    else if([arr count] == 2)
    {
        [arr addObject:[arr objectAtIndex:0]];
        [arr addObject:[arr objectAtIndex:1]];
    }
    
    NSMutableArray *viewsArray = [@[] mutableCopy];
    

    for (int i = 0; i < [arr count]; ++i) {
        UIImageView *tempLabel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 320, 30)];
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
    
    __unsafe_unretained typeof(self) wself = self;
    _headView.TapActionBlock = ^(NSInteger pageIndex){
        
        
        SliderModel *tempSlider = [[SliderModel alloc] init];
        tempSlider = [arr objectAtIndex:pageIndex];
        
        NSLog(@"点击了第%d个,%@",pageIndex,tempSlider.type);
        
        
        switch ([tempSlider.type integerValue]) {
            case 1:
            {
                WaterDetailViewController *wdVC = [[WaterDetailViewController alloc] initWithTitle:@"图片详情" andPid:tempSlider.type_id];
                [wself presentViewController:wdVC animated:YES completion:nil];
            }
                break;
            case 2:
            {
                InfoDetailViewController *idVC = [[InfoDetailViewController alloc] initWithTitle:@"咨询活动详情" NewsId:tempSlider.type_id ]; // initWithNewsId:tempSlider.type_id];
//                [idVC showBackButton];
//                [wself.navigationController pushViewController:idVC animated:YES];
                [wself presentViewController:idVC animated:YES completion:nil];
            }
                break;
            case 3:
            {
                GoodsViewController *gVC = [[GoodsViewController alloc] initWithGid:tempSlider.type_id Title:@"商品详情"];
                [wself presentViewController:gVC animated:YES completion:nil];
            }
                break;
            case 4:
            {
                CouponDetailViewController *cdVC = [[CouponDetailViewController alloc] initWithTitle:@"优惠券详情" andCouponId:tempSlider.type_id];
                [wself presentViewController:cdVC animated:YES completion:nil];
            }
                break;
            default:
                break;
        }
        
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
    
    
//    [_adView setImageWithURL:_mainResponseModel.admodel.img placeholderImage:[UIImage imageNamed:@"图片默认2.png"] success:nil failure:nil];
    
//    _adView.userInteractionEnabled = YES;
    
//    UITapGestureRecognizer *imageTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adTouch:)];
    
//    [_adView addGestureRecognizer:imageTouch];
    
}


-(void)menuItemClick:(NSInteger)tag
{
    GoodsModel *model = [_mainResponseModel.hotArr objectAtIndex:tag];
    GoodsViewController *gvc = [[GoodsViewController alloc] initWithGid:model.gid Title:@"商品详情"];
    
    [self presentViewController:gvc animated:YES completion:nil];
}


//-(void)sliderItemClick:(NSInteger)tag
//{
//    //
//    
//    SliderModel *model = [_mainResponseModel.sliderArr objectAtIndex:tag];
//    
//
//    
//}



-(void)adTouch:(UIGestureRecognizer *)gesture
{
    NSLog(@"ad to %@",_mainResponseModel.admodel.url);
    [CoreHelper loadWebPage:_mainResponseModel.admodel.url];
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
    CouponViewController *couponVC = [[CouponViewController alloc] initWithTitle:@"电子优惠券"];
    [self.navigationController presentViewController:couponVC animated:YES completion:nil];
}

-(void)jumpToWaterFlow
{
    Water2ViewController *waterVC = [[Water2ViewController alloc] initWithTitle:@"图片墙" sellerid:CustomID start:@"0" limit:@"10"];
    [self.navigationController presentViewController:waterVC animated:YES completion:nil];
}
-(void)jumpToMyFav
{
//    if (![CoreHelper checkLogin])
//    {
//        LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
//        [self.navigationController presentViewController:loginController animated:YES completion:nil];
//    }
//    else
//    {
//        MyFavViewController *favVC = [[MyFavViewController alloc] init];
//        [favVC showBackButton];
//        [self.navigationController pushViewController:favVC animated:YES];
//    }
    
    
    ShooInfoController *shopInfoVC = [[ShooInfoController alloc] init];
    [shopInfoVC showBackButton];
    //    shopInfoVC.title = @"商家信息";
    [self.navigationController pushViewController:shopInfoVC animated:YES];
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
