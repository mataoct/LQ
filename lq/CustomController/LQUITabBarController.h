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

#import "MemberCenterViewController.h"

#import "CartViewController.h"

#import "InfoViewController.h"

@interface LQUITabBarController : UITabBarController<UITabBarControllerDelegate>

//@property (nonatomic,strong) MainViewController *mainVC;

@property (nonatomic,strong) MainNavigationController *mainNC;

@property (nonatomic,strong) LoginViewController *loginVC;
@property (nonatomic,strong) MemberCenterViewController *mbVC;
@property (nonatomic,strong) MainNavigationController *memberCenterNC;

@property (nonatomic,strong) MenuViewController *menuVC;
@property (nonatomic,strong) MainNavigationController *menuNC;

@property (nonatomic,strong) CartViewController *cartVC;
@property (nonatomic,strong) MainNavigationController *cartNC;

@property (nonatomic,strong) InfoViewController *infoVC;
@property (nonatomic,strong) MainNavigationController *infoNC;

@end
