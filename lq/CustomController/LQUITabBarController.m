//
//  LQUITabBarController.m
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUITabBarController.h"
#import "UIImageView+WebCache.h"

@interface LQUITabBarController ()

@end

@implementation LQUITabBarController


-(id)init
{
    self = [super init];
    if (self) {
        //
        
//        [self.tabBar setTintColor:[UIColor orangeColor]];
//        [self.tabBar setSelectedImageTintColor:[UIColor redColor]];
        
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
    
//    _mainNC = [[MainNavigationController alloc] initWithRootViewController:[[MainViewController alloc] initWithTitle:@"首页"]];
    
    _mainNC = [[MainNavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    UITabBarItem *mainItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"菜单栏-主页.png"] selectedImage:[UIImage imageNamed:@"菜单栏-主页.png"]];
    mainItem.tag = 0;
    _mainNC.tabBarItem=mainItem ;

    
    
    
    _loginVC = [[LoginViewController alloc] init];
    _loginVC.title = @"会员";
    
    _mbVC = [[MemberCenterViewController alloc] init];
    _mbVC.title  = @"会员";
    
//    _memberCenterNC = [[MainNavigationController alloc] initWithRootViewController:_loginVC];
    _memberCenterNC = [[MainNavigationController alloc] initWithRootViewController:_mbVC];
    
//    UITabBarItem *memberCenterItem = [[UITabBarItem alloc] initWithTitle:@"会员" image:nil selectedImage:nil];
    UITabBarItem *memberCenterItem = [[UITabBarItem alloc] initWithTitle:@"会员" image:[UIImage imageNamed:@"菜单栏-会员.png"] selectedImage:[UIImage imageNamed:@"菜单栏-会员.png"]];
    
    
//    memberCenterItem.
    
    memberCenterItem.tag = 4;
    _memberCenterNC.tabBarItem=memberCenterItem ;
    

    
    
    _menuVC = [[MenuViewController alloc] init];
    _menuVC.title = @"菜单";
    _menuNC = [[MainNavigationController alloc] initWithRootViewController:_menuVC];
    
    UITabBarItem *menuItem = [[UITabBarItem alloc] initWithTitle:@"菜单" image:[UIImage imageNamed:@"菜单栏-菜单.png"] selectedImage:[UIImage imageNamed:@"菜单栏-菜单.png"]];
    menuItem.tag = 1;
    _menuNC.tabBarItem = menuItem   ;
    
    
    
    _cartVC = [[CartViewController alloc] init];
    _cartVC.title = @"购物车";
    _cartNC = [[MainNavigationController alloc] initWithRootViewController:_cartVC];
    
    UITabBarItem *cartItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:[UIImage imageNamed:@"菜单栏-购物车.png"] selectedImage:[UIImage imageNamed:@"菜单栏-购物车.png"]];
    cartItem.tag = 3;
    _cartNC.tabBarItem = cartItem;
    
    
    
    _infoVC = [[InfoViewController alloc] init];
    _infoVC.title = @"活动资讯";
    _infoNC = [[MainNavigationController alloc] initWithRootViewController:_infoVC];
    
    UITabBarItem *infoItem = [[UITabBarItem alloc] initWithTitle:@"活动资讯" image:[UIImage imageNamed:@"菜单栏-活动资讯.png"] selectedImage:[UIImage imageNamed:@"菜单栏-活动资讯.png"]];
    _infoNC.tabBarItem = infoItem;
    infoItem.tag = 2;
    
    self.viewControllers = [NSArray arrayWithObjects:_mainNC,_infoNC,_menuNC,_cartNC,_memberCenterNC, nil];
    
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-1.png"]];
//    [self.tabBar setTintColor:[UIColor blackColor]];
    [self.tabBar setSelectedImageTintColor:[UIColor whiteColor]];
//    [self.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tabbg.png"]];
    
    
//    [self.tabBar setBackgroundColor:DarkGreen];

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


@end
