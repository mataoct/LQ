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
    
    
    _leftItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backToPrevious)];
    
    [_item setLeftBarButtonItem:_leftItem];
    
    _bar.tintColor = [UIColor greenColor];
    [_bar pushNavigationItem:_item animated:NO];
    self.navigationController.navigationBarHidden  = YES;
    [self.view addSubview:_bar];
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


@end
