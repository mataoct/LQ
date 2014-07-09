//
//  LQUITabBarController.m
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUITabBarController.h"

@interface LQUITabBarController ()

@end

@implementation LQUITabBarController


-(id)init
{
    self = [super init];
    if (self) {
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
    // Do any additional setup after loading the view.
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    _mainNC = [[MainNavigationController alloc] initWithRootViewController:[[MainViewController alloc] initWithTitle:@"首页"]];
    
    UITabBarItem *mainItem = [[UITabBarItem alloc] initWithTitle:@"main" image:nil selectedImage:nil];
    _mainNC.tabBarItem=mainItem ;
    
//    _memberCenterNC = [[MainNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    
    
    _loginVC = [[LoginViewController alloc] init];
    _loginVC.title = @"会员";
    _memberCenterNC = [[MainNavigationController alloc] initWithRootViewController:_loginVC];
    
    UITabBarItem *memberCenterItem = [[UITabBarItem alloc] initWithTitle:@"会员" image:nil selectedImage:nil];
    _memberCenterNC.tabBarItem=memberCenterItem ;
    
    
    
    _menuVC = [[MenuViewController alloc] init];
    _menuVC.title = @"菜单";
    _menuNC = [[MainNavigationController alloc] initWithRootViewController:_menuVC];
    
    UITabBarItem *menuItem = [[UITabBarItem alloc] initWithTitle:@"菜单" image:nil selectedImage:nil];
    _menuNC.tabBarItem = menuItem   ;
    
    self.viewControllers = [NSArray arrayWithObjects:_mainNC,_menuNC,_memberCenterNC, nil];
    
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
