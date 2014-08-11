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


#import "MainPageBaseRequestModel.h"
#import "CouponViewController.h"
#import "SliderModel.h"

@interface MainViewController : LQUIViewController<SDWebImageDownloaderDelegate,SDImageCacheDelegate,SDWebImageManagerDelegate,RequestModelDelegate,MenuItemDelegate>

@property (nonatomic,retain) CycleScrollView *headView;
@property (nonatomic,retain) MainPageBaseRequestModel  *requestModel;
@property (nonatomic,strong) MainResponseModel *mainResponseModel;
@property (nonatomic,strong) MenuItemView *menuList;

@end
