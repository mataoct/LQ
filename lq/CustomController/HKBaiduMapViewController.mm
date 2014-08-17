//
//  HKBaiduMapViewController.m
//  HK
//
//  Created by 马涛 on 14-5-4.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKBaiduMapViewController.h"

@interface HKBaiduMapViewController ()

@property (nonatomic,strong) BMKPointAnnotation* fingerPt;
@property (nonatomic,strong) NSString *address;

@end

@implementation HKBaiduMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithX:(float)x Y:(CGFloat)y
{
    self = [super init];
    if (self) {
        //
        
        if (_mapView == nil) {
            _mapView = [[BMKMapView alloc] initWithFrame:self.view.frame];
            [self.view addSubview:_mapView];
        }
        
        if (_search == nil) {
            _search = [[BMKSearch alloc] init];
        }
        
        CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};
		pt = (CLLocationCoordinate2D){x, y};
        
        
        _mylatitude = x;
        _mylongitude = y;
        
        [_mapView setCenterCoordinate:pt];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    _address = [[NSString alloc] init];
    
    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
//    [self.navigationItem setRightBarButtonItem:rightButton];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    [self.navigationItem setLeftBarButtonItem:leftButton];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    _search.delegate = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _search.delegate = self;
    [_mapView setZoomLevel:19];
    

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CLLocationCoordinate2D finger = {_mylatitude,_mylongitude};
    
    _fingerPt = [[BMKPointAnnotation alloc] init];
    _fingerPt.coordinate = finger;
    
    
    
    
    [_mapView addAnnotation:_fingerPt];
    
    
    _fingerPt.title = @"店在这里";
    [_mapView selectAnnotation:_fingerPt animated:YES];//标题和子标题自动显示
    
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

//- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
//
//{
//    
////    NSLog(@"onClickedMapBlank-latitude==%f,longitude==%f",coordinate.latitude,coordinate.longitude);
////    
////    NSString* showmeg = [NSString stringWithFormat:@"您点击了地图空白处(blank click).\r\n当前经度:%f,当前纬度:%f,\r\nZoomLevel=%d;RotateAngle=%d;OverlookAngle=%d", coordinate.longitude,coordinate.latitude,(int)_mapView.zoomLevel,_mapView.rotation,_mapView.overlooking];
////    
////    NSLog(@"%@",showmeg);
//
//    [self reverseGeocodeX:coordinate.longitude Y:coordinate.latitude];
//    
//    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
//	[_mapView removeAnnotations:array];
//	array = [NSArray arrayWithArray:_mapView.overlays];
//	[_mapView removeOverlays:array];
//    
//    CLLocationCoordinate2D finger = {coordinate.latitude,coordinate.longitude};
//    
//    _fingerPt = [[BMKPointAnnotation alloc] init];
//    _fingerPt.coordinate = finger;
//    
//    
//    
//    
//    [_mapView addAnnotation:_fingerPt];
//    
//}




//- (void)onGetAddrResult:(BMKSearch*)searcher result:(BMKAddrInfo*)result errorCode:(int)error
//{
//
//    
//	if (error == 0) {
//		BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
//		item.coordinate = result.geoPt;
//		item.title = result.strAddr;
//        
//        _fingerPt.title = result.strAddr;
//        [_mapView selectAnnotation:_fingerPt animated:YES];//标题和子标题自动显示
//        
////        NSLog(@"here is %@",item.title);
//        
//        
//        _address = item.title;
//
//        
//        //        _search.delegate = nil; //定位成功后停用，避免覆盖用户输入地址和地图控制器回传地址信息
//	}
//    
//}


////添加标注
//- (void)addPointAnnotation
//{
//    pointAnnotation = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor;
//    coor.latitude = 39.915;
//    coor.longitude = 116.404;
//    pointAnnotation.coordinate = coor;
//    pointAnnotation.title = @"test";
//    pointAnnotation.subtitle = @"此Annotation可拖拽!";
//    [_mapView addAnnotation:pointAnnotation];
//    [pointAnnotation release];
//    
//}


-(void)reverseGeocodeX:(float)x Y:(float)y
{
    
//    NSLog(@"%f,%f",x,y);
    
	CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};
    pt = (CLLocationCoordinate2D){y, x};
    
	BOOL flag = [_search reverseGeocode:pt];
	if (flag) {
		NSLog(@"ReverseGeocode search success.");
        
	}
    else{
        NSLog(@"ReverseGeocode search failed!");
    }
}


-(void)sure
{
    if ([_address length] <= 0) {
        //
        
        [SVProgressHUD showErrorWithStatus_custom:@"无效地址" duration:2];
        return;
    }
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"kGetLocalByUserSet" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:_address,@"local", nil]];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
