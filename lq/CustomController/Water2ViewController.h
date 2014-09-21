//
//  Water2ViewController.h
//  lq
//
//  Created by  matao on 14-9-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LQUIViewController.h"
#import "ImageViewCell.h"
#import "WatetFlowRequestModel.h"
#import "WaterDetailViewController.h"

#import "CollectionCell.h"

#import "MJRefresh.h"



@interface Water2ViewController : LQUIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,RequestModelDelegate>

@property (nonatomic,strong) NSMutableArray *arrayData;
@property (nonatomic,strong) NSMutableArray *sourceArr;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,strong) NSString *limit;


@property (nonatomic,strong) WatetFlowRequestModel *requestModel;
@property (nonatomic,strong) WaterFlowResponseModel *responseModel;


-(id)initWithTitle:(NSString *)str sellerid:(NSString *)sellerid start:(NSString *)start limit:(NSString *)limit;


@end
