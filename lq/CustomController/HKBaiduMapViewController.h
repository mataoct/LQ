//
//  HKBaiduMapViewController.h
//  HK
//
//  Created by 马涛 on 14-5-4.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "SVProgressHUD.h"
#import "LQ7ViewController.h"

@interface HKBaiduMapViewController : LQ7ViewController<BMKMapViewDelegate,BMKSearchDelegate>

@property (nonatomic,strong) BMKMapView *mapView;
@property (nonatomic,strong) BMKSearch *search;


@property (nonatomic,assign) float mylatitude;
@property (nonatomic,assign) float mylongitude;


-(id)initWithX:(float)x Y:(CGFloat)y;

@end
