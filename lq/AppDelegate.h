//
//  AppDelegate.h
//  lq
//
//  Created by 马涛 on 14-6-18.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base64codeFunc.h"
#import "LQUITabBarController.h"
#import "LQUINavigationController.h"
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) LQUITabBarController *tabbar;
@end
