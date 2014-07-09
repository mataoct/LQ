//
//  MainViewController.h
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"

#import "CycleScrollView.h"
#import "UIImageView+WebCache.h"
#import "MenuItemView.h"

#import "DiscountTableViewController.h"

@interface MainViewController : LQUIViewController<SDWebImageDownloaderDelegate,SDImageCacheDelegate,SDWebImageManagerDelegate>

@property (nonatomic,retain) CycleScrollView *headView;

@end
