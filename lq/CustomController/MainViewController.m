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
    _requestModel.delegate = self;
    [_requestModel postData];
    
    
    [self setBackButtonHide:YES];
    
    NSArray *arr = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"http://images.17173.com/2014/act/2014/06/15/xyws20140615_3.jpg",@"img",@"aciontUrl1",@"url", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"http://images.17173.com/2014/act/2014/06/19/zqmzd20140619.jpg",@"img",@"aciontUrl2",@"url", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"http://images.17173.com/2014/act/2014/06/15/zx20140615_2.jpg",@"img",@"aciontUrl3",@"url", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"http://i3.17173.itc.cn/2014/818/2014/06/0620/yzqx-sy.jpg",@"img",@"aciontUrl4",@"url", nil], nil];
    [self setScroller:arr];
    [self setMenu];
    [self menuList];
    // Do any additional setup after loading the view.
}


-(void)setScroller:(NSArray *)arr
{
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < [arr count]; ++i) {
        UIImageView *tempLabel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
        
        tempLabel.userInteractionEnabled = YES;

        
        NSURL *url = [[NSURL alloc] initWithString:[[arr objectAtIndex:i] objectForKey:@"img"]];
//        SDWebImageManager *manager = [SDWebImageManager sharedManager];UIImage *cachedImage = [manager imageWithURL:url]; // 将需要缓存的图片加载进来
//        if (cachedImage) {
//            // 如果Cache命中，则直接利用缓存的图片进行有关操作      // Use the cached image immediatly
//        }
//        else {
//            // 如果Cache没有命中，则去下载指定网络位置的图片，并且给出一个委托方法      // Start an async download
//            [manager downloadWithURL:url delegate:self];
//        }
        
        
        
        
        [tempLabel setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
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
        NSLog(@"点击了第%d个,%@",pageIndex,[[arr objectAtIndex:pageIndex] objectForKey:@"url"]);
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
    
    
    [self.view addSubview:fastOrder];
    [self.view addSubview:picWall];
    [self.view addSubview:myFav];
    [self.view addSubview:discount];
    
    
    UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(0, 180, 320, 36)];
    adView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:adView];
    
}

-(void)menuList
{
    
    MenuItemView *menuList = [[MenuItemView alloc] initWithFrame:CGRectMake(0, 234, 320,self.view.frame.size.height- 20 -44 - 47 - 100 -70 -10) andDate:[NSDictionary  dictionaryWithObjectsAndKeys:@"1",@"1",@"1",@"2",@"1",@"3",@"1",@"4",@"1",@"5",@"1",@"6",@"1",@"7", nil]];
    
    [self.view addSubview:menuList];
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
    DiscountTableViewController *discountTable = [[DiscountTableViewController alloc] initWithStyle:UITableViewStylePlain withDic:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil]];
    
    [self.navigationController pushViewController:discountTable animated:YES];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    // Do something with the downloaded image
}





@end
