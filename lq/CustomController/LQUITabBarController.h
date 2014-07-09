//
//  LQUITabBarController.h
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainViewController.h"

#import "MainNavigationController.h"

#import "LoginViewController.h"

#import "MenuViewController.h"

@interface LQUITabBarController : UITabBarController<UITabBarControllerDelegate>

//@property (nonatomic,strong) MainViewController *mainVC;

@property (nonatomic,strong) MainNavigationController *mainNC;

@property (nonatomic,strong) LoginViewController *loginVC;

@property (nonatomic,strong) MainNavigationController *memberCenterNC;

@property (nonatomic,strong) MenuViewController *menuVC;

@property (nonatomic,strong) MainNavigationController *menuNC;

@end
