//
//  WaterFlowViewController.h
//  lq
//
//  Created by 马涛 on 14-8-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "WaterFlowView.h"
#import "ImageViewCell.h"
#import "WatetFlowRequestModel.h"
//#import "WaterFlowResponseModel.h"
//#import "UIImageView+WebCache.h"
#import "WaterDetailViewController.h"
#import "LQ7ViewController.h"

@interface WaterFlowViewController : LQUIViewController<WaterFlowViewDelegate,WaterFlowViewDataSource,RequestModelDelegate>
    
@property (nonatomic,strong) NSMutableArray *arrayData;
@property (nonatomic,strong) WaterFlowView *waterFlow;

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;


@property (nonatomic,strong) WatetFlowRequestModel *requestModel;
@property (nonatomic,strong) WaterFlowResponseModel *responseModel;

- (void)dataSourceDidLoad;
- (void)dataSourceDidError;


-(id)initWithTitle:(NSString *)str sellerid:(NSString *)sellerid start:(NSString *)start limit:(NSString *)limit;

@end
