//
//  LQUIViewController.m
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"

@interface LQUIViewController ()

@property (nonatomic,retain) NSString *headTitle;


//@property (nonatomic,retain) UINavigationItem *item;
@property (nonatomic,retain) UIBarButtonItem *leftItem;
//@property (nonatomic,retain) UIBarButtonItem *rightItem;
@end

@implementation LQUIViewController


-(id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}


-(id)initWithTitle:(NSString *)str
{
    self = [super init];
    if (self) {
        //
        _headTitle = [[NSString alloc] init];
        _headTitle = str;

        
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

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
    // Do any additional setup after loading the view.
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    _bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
    _item = [[UINavigationItem alloc] initWithTitle:_headTitle];
    
//    _item.titleView.tintColor = [UIColor whiteColor];
    
//    _bar.tintColor = [UIColor whiteColor];
    
    
    [_bar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor whiteColor], UITextAttributeTextColor,
                                [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:0],UITextAttributeTextShadowColor,
                                [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],UITextAttributeTextShadowOffset,
                                [UIFont systemFontOfSize:18], UITextAttributeFont,
                                nil]];
    
    
    _statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    temp.backgroundColor = DarkGreen;
    [_bar addSubview:temp];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn. frame=CGRectMake(15, 5, 30, 24);
    [btn setBackgroundImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backToPrevious)forControlEvents:UIControlEventTouchUpInside];
    _leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    _statusView.backgroundColor = DarkGreen;
    
    self.view.backgroundColor = BackGray;
    
    [_item setLeftBarButtonItem:_leftItem];
    
    [_bar pushNavigationItem:_item animated:NO];
    [self.view addSubview:_bar];
    [self.view addSubview:_statusView];
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

-(void)backToPrevious
{
//    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.navigationController) {
         [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
//        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
   
}


-(void)setBackButtonHide:(BOOL)hide
{
    if (hide)
    {
        [_item setLeftBarButtonItem:nil];
    }
    else
    {
        [_item setLeftBarButtonItem:_leftItem];
    }
}


//-(void)selectRightAction:(id)sender
//{
//    NSLog(@"right clicl");
//}


@end
