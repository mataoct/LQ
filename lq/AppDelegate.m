//
//  AppDelegate.m
//  lq
//
//  Created by 马涛 on 14-6-18.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AppDelegate.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    _tabbar = [[LQUITabBarController alloc] init];
    
    
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:tabbar];
    
    self.window.rootViewController = _tabbar;
    _tabbar.delegate = self;
    
    
//    UINavigationController *navi = [[UINavigationController alloc] init];
    
    
    
//    NSString   *encodeStr = @"matao";
//    
//    NSString *decodeStr = __BASE64(encodeStr);
//    
//    NSLog(@"decodeStr %@ ,reEncodeStr %@", decodeStr,__TEXT(decodeStr));
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    self
}




- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    switch (viewController.tabBarItem.tag) {
        case 1:
        case 2:
        case 3:
        case 4:
        {
            if (![CoreHelper checkLogin]) {
                
                LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
                LQUINavigationController *navi = [[LQUINavigationController alloc] initWithRootViewController:loginController];
                [_tabbar presentViewController:navi animated:YES completion:nil];
                
                return false;
            }
            return true;
        }
            break;

            
        default:
            return true;
            break;
    }
}



@end
