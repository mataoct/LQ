//
//  AppDelegate.m
//  lq
//
//  Created by 马涛 on 14-6-18.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDelegate.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "PartnerConfig.h"

BMKMapManager* _mapManager;

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
    
    
    _mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [_mapManager start:@"vIPbxUHPjFqitsdURYsq4F7Q" generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
//    UINavigationController *navi = [[UINavigationController alloc] init];
    
    
    
//    NSString   *encodeStr = @"matao";
//    
//    NSString *decodeStr = __BASE64(encodeStr);
//    
//    NSLog(@"decodeStr %@ ,reEncodeStr %@", decodeStr,__TEXT(decodeStr));
    
    [[UINavigationBar appearance] setBarTintColor:DarkGreen];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
//;
    
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
        {
            {
                if (![CoreHelper checkLogin]) {
                    
                    LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
                    //                LQUINavigationController *navi = [[LQUINavigationController alloc] initWithRootViewController:loginController];
                    [_tabbar presentViewController:loginController animated:YES completion:nil];
                    
                    return false;
                }
                [_tabbar.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-3.png"]];
                return true;
            }
            break;

        }
        case 2:
        {
//            if (![CoreHelper checkLogin]) {
//                
//                LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
//                //                LQUINavigationController *navi = [[LQUINavigationController alloc] initWithRootViewController:loginController];
//                [_tabbar presentViewController:loginController animated:YES completion:nil];
//                
//                return false;
//            }
            [_tabbar.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-2.png"]];
            return true;
        }
            break;

        case 3:
        {
            if (![CoreHelper checkLogin]) {
                
                LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
                //                LQUINavigationController *navi = [[LQUINavigationController alloc] initWithRootViewController:loginController];
                [_tabbar presentViewController:loginController animated:YES completion:nil];
                
                return false;
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"kCartBtnBadgeChange" object:@"1" userInfo:nil];
            [_tabbar.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-4.png"]];
            return true;
        }
            break;

        case 4:
        {
            if (![CoreHelper checkLogin]) {
                
                LoginViewController *loginController = [[LoginViewController alloc] initWithTitle:@"登陆"];
//                LQUINavigationController *navi = [[LQUINavigationController alloc] initWithRootViewController:loginController];
                [_tabbar presentViewController:loginController animated:YES completion:nil];
                
                return false;
            }
            [_tabbar.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-5.png"]];
            return true;
        }
            break;

            
        default:
            [_tabbar.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-1.png"]];
            return true;
            break;
    }
}



//独立客户端回调函数
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	
	[self parse:url application:application];
	return YES;
}

- (void)parse:(NSURL *)url application:(UIApplication *)application {
    
    //结果处理
    AlixPayResult* result = [self handleOpenURL:url];
    
    
    NSLog(@"result %d",result.statusCode);
    
	if (result)
    {
		
		if (result.statusCode == 9000)
        {
			/*
			 *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
			 */
            
            //交易成功
            //            NSString* key = AlipayPubKey;
			id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(AlipayPubKey);
            
			if ([verifier verifyString:result.resultString withSign:result.signString])
            {
                //验证签名成功，交易结果无篡改
                NSLog(@"success");
                
                //                NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alipaySuccess" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"9000",@"payResultStatus", nil]];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"orderlist" object:self];
			}
        }
        else
        {
            //交易失败
            
            NSLog(@"failed");
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"payReusltCode" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"payResultStatus", nil]];
        }
    }
    else
    {
        //失败
        NSLog(@"failed 2");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"payReusltCode" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"payResultStatus", nil]];
    }
    
}

- (AlixPayResult *)resultFromURL:(NSURL *)url {
	NSString * query = [[url query] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#if ! __has_feature(objc_arc)
    return [[[AlixPayResult alloc] initWithString:query] autorelease];
#else
	return [[AlixPayResult alloc] initWithString:query];
#endif
}

- (AlixPayResult *)handleOpenURL:(NSURL *)url {
	AlixPayResult * result = nil;
	
	if (url != nil && [[url host] compare:@"safepay"] == 0) {
		result = [self resultFromURL:url];
	}
    
	return result;
}



@end
