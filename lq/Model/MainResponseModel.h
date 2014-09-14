//
//  MainResponseModel.h
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "SliderModel.h"
#import "AdModel.h"
#import "HotModel.h"

@interface MainResponseModel : BaseResponseModel


@property (nonatomic,strong) NSMutableArray *sliderArr;
@property (nonatomic,strong) NSMutableArray *hotArr;
@property (nonatomic,strong) AdModel *admodel;

@property (nonatomic,strong) NSString *phoneStr;


-(id)initWithDic:(NSDictionary *)dic;


@end
